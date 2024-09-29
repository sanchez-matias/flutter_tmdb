import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/title_account_state_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';

abstract class MoviesDatasource {
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getUpcoming({int page = 1});

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

  @override
  Future<List<GenericSlideModel>> getFavoriteMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/favorite/movies', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getRatedMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/rated/movies', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getWatchlistMovies({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/watchlist/movies', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });

    return _fromJsonToSlideModel(response.data);
  }
  
  @override
  Future<TitleAccountState> getMovieAccountState({
    required String sessionId, 
    required String movieId,
  }) async {
    final response = await dio.get('/movie/$movieId/account_states', queryParameters: {
      'session_id': sessionId,
    });

    return TitleAccountStateModel.fromJson(response.data);
  }
  
  @override
  Future<void> setMovieFavorite({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) async {
    await dio.post('/account/$accountId/favorite', queryParameters: {
      'session_id': sessionId,
      'media_type': 'movie',
      'media_id': movieId,
      'favorite': value.toString()
    });
  }

  @override
  Future<void> setMovieWatchlist({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) async {
    await dio.post('/account/$accountId/watchlist', queryParameters: {
      'session_id': sessionId,
      'media_type': 'movie',
      'media_id': movieId,
      'watchlist': value.toString()
    });
  }
  

}
