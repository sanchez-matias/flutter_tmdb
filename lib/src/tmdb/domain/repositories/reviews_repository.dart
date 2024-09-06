import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';

abstract class ReviewsRepository {
  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1});

  Future<List<ReviewModel>> getMovieReviews({required String id, int page = 1});
}