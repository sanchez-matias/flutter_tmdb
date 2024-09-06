import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/person_model.dart';

abstract class PeopleDatasource {
  Future<List<GenericSlideModel>> getPopularPeople({int page = 1});

  Future<List<GenericSlideModel>> getMovieCasting({required String id, int page = 1});

  Future<List<GenericSlideModel>> getTvCasting({required String id, int page = 1});

  Future<List<GenericSlideModel>> getPersonParticipations(String personId);

  Future<PersonModel> getPersonById(String id);
}

class PeopleDatasourceImpl extends PeopleDatasource {
  final Dio dio;

  PeopleDatasourceImpl(this.dio);

  List<GenericSlideModel> _fromJsonToSlideModel(Map<String, dynamic> json) {
    final List<dynamic> rawResponse = json["cast"];

    return rawResponse
      .where((rawItem) => rawItem["id"] != null)
      .map((rawMovie) => GenericSlideModel.fromPersonJson(rawMovie))
      .toList();
  }

  @override
  Future<List<GenericSlideModel>> getMovieCasting({required String id, int page = 1}) async {
    final response = await dio.get('/movie/$id/credits', queryParameters: {
      "page": page,
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getPopularPeople({int page = 1}) async {
    final response = await dio.get('/person/popular', queryParameters: {
      "page": page,
    });

    final List<dynamic> rawSlide = response.data["results"];

    return rawSlide
      .where((rawItem) => rawItem["id"] != null)
      .map((rawMovie) => GenericSlideModel.fromPersonJson(rawMovie))
      .toList();
  }

  @override
  Future<List<GenericSlideModel>> getTvCasting({required String id, int page = 1}) async {
    final response = await dio.get('/tv/$id/credits', queryParameters: {
      "page": page,
    });

    return _fromJsonToSlideModel(response.data);
  }
  
  @override
  Future<PersonModel> getPersonById(String id) async {
    final response = await dio.get('/person/$id');

    return PersonModel.fromJson(response.data);
  }
  
  @override
  Future<List<GenericSlideModel>> getPersonParticipations(String personId) async {
    final response = await dio.get('/person/$personId/combined_credits');
    final List<dynamic> rawResponse = response.data['cast'];

    return rawResponse.map((rawSlide) {
      if (rawSlide['media_type'] == 'movie') {
        return GenericSlideModel.fromMovieJson(rawSlide);
      } else {
        return GenericSlideModel.fromTvJson(rawSlide);
      }
    }).toList();
  }

}
