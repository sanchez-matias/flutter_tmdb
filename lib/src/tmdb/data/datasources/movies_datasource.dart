import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';

abstract class MoviesDatasource {
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getUpcoming({int page = 1});

  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1});

  Future<MovieModel> getMovieById(String id);

  Future<List<GenericSlideModel>> getSimilarMovies(String id);
}

class MoviesDatasourceImpl extends MoviesDatasource {
  final Dio dio;

  MoviesDatasourceImpl(this.dio);

  List<GenericSlideModel> _fromJsonToSlideModel(Map<String, dynamic> json) {
    final List<dynamic> rawMovies = json["results"];

    return rawMovies
        .where((rawMovie) => rawMovie["id"] != null)
        .map((rawMovie) => GenericSlideModel.fromMovieJson(rawMovie))
        .toList();
  }

  @override
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1}) async {
    final response =
        await dio.get('/trending/movie/day', queryParameters: {'page': page});

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<MovieModel> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    return MovieModel.fromJson(response.data);
  }
  
  @override
  Future<List<GenericSlideModel>> getSimilarMovies(String id) async {
    final response = await dio.get('/movie/$id/similar');

    return _fromJsonToSlideModel(response.data);
  }
}
