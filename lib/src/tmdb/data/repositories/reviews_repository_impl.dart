import 'package:flutter_tmdb/src/tmdb/data/datasources/reviews_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/repositories/reviews_repository.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final ReviewsDatasource _datasource;

  ReviewsRepositoryImpl(this._datasource);

  @override
  Future<List<ReviewModel>> getMovieReviews({required String id, int page = 1}) {
    return _datasource.getMovieReviews(id: id, page: page);
  }

  @override
  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1}) {
    return _datasource.getTvReviews(id: id, page: page);
  }
}
