// import 'package:flutter_tmdb/core/typedef/movies_typedef.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/movies_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDatasource _datasource;

  MoviesRepositoryImpl(this._datasource);

  @override
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1}) {
    return _datasource.getNowPlaying(
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getTopRated({int page = 1}) {
    return _datasource.getTopRated(
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getUpcoming({int page = 1}) {
    return _datasource.getUpcoming(
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1}) {
    return _datasource.getTodaysTrending(
      page: page,
    );
  }

  @override
  Future<MovieModel> getMovieById(String id) {
    return _datasource.getMovieById(id);
  }

  @override
  Future<List<GenericSlideModel>> getSimilarMovies(String id) {
    return _datasource.getSimilarMovies(id);
  }
}
