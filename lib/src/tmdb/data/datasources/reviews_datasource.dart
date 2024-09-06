import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';

abstract class ReviewsDatasource {
  Future<List<ReviewModel>> getMovieReviews({required String id, int page = 1});

  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1});
}

class ReviewsDatasourceImpl extends ReviewsDatasource {
  final Dio dio;

  ReviewsDatasourceImpl(this.dio);

  @override
  Future<List<ReviewModel>> getMovieReviews({required String id, int page = 1}) async {
    final response = await dio.get('/movie/$id/reviews');

    final List<dynamic> rawReviews = response.data["results"];

    return rawReviews
        .where((element) => element["id"] != null)
        .map((element) => ReviewModel.fromJson(element))
        .toList();
  }

  @override
  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1}) async {
    final response = await dio.get('/tv/$id/reviews', queryParameters: {
      'page': page,
    });

    final List<dynamic> rawReviews = response.data['results'];

    return rawReviews
        .where((element) => element['id'] != null)
        .map((element) => ReviewModel.fromJson(element))
        .toList();
  }
}
