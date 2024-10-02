import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';

abstract class MoviesRepository {
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1});

  Future<List<GenericSlideModel>> getUpcoming({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1});

  Future<MovieModel> getMovieById(String id);

  Future<List<GenericSlideModel>> getSimilarMovies(String id);

  Future<List<GenericSlideModel>> getRatedMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<List<GenericSlideModel>> getWatchlistMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<List<GenericSlideModel>> getFavoriteMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<TitleAccountState> getMovieAccountState({
    required String sessionId,
    required String movieId,
  });

  Future<void> setMovieFavorite({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  });

  Future<void> setMovieWatchlist({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  });

  Future<void> castMovieRaiting({
    required String sessionId,
    required String movieId,
    required int value,
  });

  Future<void> deleteMovieRaiting({
    required String sessionId,
    required String movieId,
  });
}