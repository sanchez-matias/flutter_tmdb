import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/title_account_state_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_episode_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_model.dart';

abstract class TvDatasource {
  Future<List<GenericSlideModel>> getAirigToday({int page = 1});

  Future<List<GenericSlideModel>> getOnTheAir({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1});

  Future<TvSeriesModel> getTvSeriesById(String id);

  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1});

  Future<List<GenericSlideModel>> getSimilarSeries({required String id, int page = 1});

  Future<List<TvEpisodeModel>> getSeasonEpisodes({required String tvId, required int season});

  Future<List<GenericSlideModel>> getRatedTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<List<GenericSlideModel>> getWatchlistTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<List<GenericSlideModel>> getFavoriteTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  });

  Future<TitleAccountStateModel> getTvAccountState({
    required String sessionId,
    required String tvId,
  });

  Future<void> setTvFavorite({
    required String accountId,
    required String sessionId,
    required String tvId,
    required bool value,
  });

  Future<void> setTvWatchlist({
    required String accountId,
    required String sessionId,
    required String tvId,
    required bool value,
  });

  Future<void> castTVRaiting({
    required String sessionId,
    required String tvId,
    required int value,
  });

  Future<void> deleteTvRaiting({
    required String sessionId,
    required String tvId,
  });
}

class TvDatasourceImpl extends TvDatasource {
  final Dio dio;

  TvDatasourceImpl(this.dio);

  List<GenericSlideModel> _fromJsonToSlideModel(Map<String, dynamic> json) {
    final List<dynamic> rawSeries = json["results"];

    return rawSeries
      .where((rawMovie) => rawMovie["id"] != null)
      .map((rawMovie) => GenericSlideModel.fromTvJson(rawMovie))
      .toList();
  }

  @override
  Future<List<GenericSlideModel>> getAirigToday({int page = 1}) async {
    final response = await dio.get('/tv/airing_today', queryParameters: {
      'page': page,
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getOnTheAir({int page = 1}) async {
    final response = await dio.get('/tv/on_the_air', queryParameters: {
      'page': page,
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1}) async {
    final response = await dio.get('/trending/tv/day', queryParameters: {
      'page': page,
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getTopRated({int page = 1}) async {
    final response = await dio.get('/tv/top_rated', queryParameters: {
      'page': page,
    });

    return _fromJsonToSlideModel(response.data);
  }
  
  @override
  Future<TvSeriesModel> getTvSeriesById(String id) async {
    final response = await dio.get('/tv/$id');

    return TvSeriesModel.fromJson(response.data);
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
  
  @override
  Future<List<GenericSlideModel>> getSimilarSeries({required String id, int page = 1}) async {
    final response = await dio.get('/tv/$id/similar');

    return _fromJsonToSlideModel(response.data);
  }
  
  @override
  Future<List<TvEpisodeModel>> getSeasonEpisodes({required String tvId, required int season}) async {
    final response = await dio.get('/tv/$tvId/season/$season');

    final List<dynamic> rawEpisodes = response.data['episodes'];

    return rawEpisodes
      .map((element) => TvEpisodeModel.fromJson(element))
      .toList();
  }
  
  @override
  Future<List<GenericSlideModel>> getFavoriteTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/favorite/tv', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });
    
    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getRatedTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/rated/tv', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<TitleAccountStateModel> getTvAccountState({
    required String sessionId,
    required String tvId,
  }) async {
    final response = await dio.get('/tv/$tvId/account_states', queryParameters: {
      'session_id': sessionId,
    });

    return TitleAccountStateModel.fromJson(response.data);
  }

  @override
  Future<List<GenericSlideModel>> getWatchlistTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) async {
    final response = await dio.get('/account/$accountId/watchlist/tv', queryParameters: {
      'session_id': sessionId,
      'page': page,
      'sort_by': 'created_at.desc',
    });

    return _fromJsonToSlideModel(response.data);
  }

  @override
  Future<void> setTvFavorite({
    required String accountId,
    required String sessionId,
    required String tvId,
    required bool value,
  }) async {
    await dio.post('/account/$accountId/favorite', queryParameters: {
      'session_id': sessionId,
      'media_type': 'tv',
      'media_id': tvId,
      'favorite': value.toString()
    });
  }

  @override
  Future<void> setTvWatchlist({
    required String accountId,
    required String sessionId,
    required String tvId,
    required bool value,
  }) async {
    await dio.post('/account/$accountId/watchlist', queryParameters: {
      'session_id': sessionId,
      'media_type': 'tv',
      'media_id': tvId,
      'watchlist': value.toString()
    });
  }
  
  @override
  Future<void> castTVRaiting({
    required String sessionId,
    required String tvId,
    required int value,
  }) async {
    await dio.post('/tv/$tvId/rating', queryParameters: {
      'session_id': sessionId,
      'value': value.toDouble(),
    });
  }

  @override
  Future<void> deleteTvRaiting({
    required String sessionId,
    required String tvId,
  }) async {
    await dio.delete('/tv/$tvId/rating', queryParameters: {
      'session_id': sessionId,
    });
  }
}

