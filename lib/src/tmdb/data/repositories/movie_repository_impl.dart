// import 'package:flutter_tmdb/core/typedef/movies_typedef.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/movies_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';
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

  @override
  Future<List<GenericSlideModel>> getFavoriteMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getFavoriteMovies(
      accountId: accountId,
      sessionId: sessionId,
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getRatedMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getRatedMovies(
      accountId: accountId,
      sessionId: sessionId,
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getWatchlistMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getWatchlistMovies(
      accountId: accountId,
      sessionId: sessionId,
      page: page,
    );
  }

  @override
  Future<TitleAccountState> getMovieAccountState({
    required String sessionId,
    required String movieId,
  }) {
    return _datasource.getMovieAccountState(
      sessionId: sessionId,
      movieId: movieId,
    );
  }
  
  @override
  Future<void> setMovieFavorite({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) {
    return _datasource.setMovieFavorite(
      accountId: accountId,
      sessionId: sessionId,
      movieId: movieId,
      value: value,
    );
  }

  @override
  Future<void> setMovieWatchlist({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) {
    return _datasource.setMovieWatchlist(
      accountId: accountId,
      sessionId: sessionId,
      movieId: movieId,
      value: value,
    );
  }
  
  @override
  Future<void> castMovieRaiting({
    required String sessionId,
    required String movieId,
    required int value,
  }) {
    return _datasource.castMovieRaiting(
      sessionId: sessionId,
      movieId: movieId,
      value: value,
    );
  }
  
  @override
  Future<void> deleteMovieRaiting({
    required String sessionId,
    required String movieId,
  }) {
    return _datasource.deleteMovieRaiting(
      sessionId: sessionId,
      movieId: movieId,
    );
  }
}
