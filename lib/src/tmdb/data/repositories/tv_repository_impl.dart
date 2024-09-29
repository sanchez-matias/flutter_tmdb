import 'package:flutter_tmdb/src/tmdb/data/datasources/tv_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/title_account_state_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_episode_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/repositories/tv_repository.dart';

class TvRepositoryImpl extends TvRepository {
  final TvDatasource _datasource;

  TvRepositoryImpl(this._datasource);

  @override
  Future<List<GenericSlideModel>> getAirigToday({int page = 1}) {
    return _datasource.getAirigToday(page: page);
  }

  @override
  Future<List<GenericSlideModel>> getOnTheAir({int page = 1}) {
    return _datasource.getOnTheAir(page: page);
  }

  @override
  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1}) {
    return _datasource.getTodaysTrending(page: page);
  }

  @override
  Future<List<GenericSlideModel>> getTopRated({int page = 1}) {
    return _datasource.getTopRated(page: page);
  }

  @override
  Future<TvSeriesModel> getTvSeriesById(String id) {
    return _datasource.getTvSeriesById(id);
  }

  @override
  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1}) {
    return _datasource.getTvReviews(id: id, page: page);
  }
  
  @override
  Future<List<GenericSlideModel>> getSimilarSeries({required String id, int page = 1}) {
    return _datasource.getSimilarSeries(id: id, page: page);
  }

  @override
  Future<List<TvEpisodeModel>> getSeasonEpisodes({required String tvId, required int season}) {
   return _datasource.getSeasonEpisodes(tvId: tvId, season: season);
  }

  @override
  Future<List<GenericSlideModel>> getFavoriteTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getFavoriteTv(
      accountId: accountId,
      sessionId: sessionId,
      page: page,
    );
  }

  @override
  Future<List<GenericSlideModel>> getRatedTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getRatedTv(
        accountId: accountId, sessionId: sessionId, page: page);
  }

  @override
  Future<TitleAccountStateModel> getTvAccountState({
    required String sessionId,
    required String movieId,
  }) {
    return _datasource.getTvAccountState(
      sessionId: sessionId,
      tvId: movieId,
    );
  }

  @override
  Future<List<GenericSlideModel>> getWatchlistTv({
    required String accountId,
    required String sessionId,
    int page = 1,
  }) {
    return _datasource.getWatchlistTv(
      accountId: accountId,
      sessionId: sessionId,
      page: page,
    );
  }

  @override
  Future<void> setTvFavorite({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) {
    return _datasource.setTvFavorite(
      accountId: accountId,
      sessionId: sessionId,
      tvId: movieId,
      value: value,
    );
  }

  @override
  Future<void> setTvWatchlist({
    required String accountId,
    required String sessionId,
    required String movieId,
    required bool value,
  }) {
    return _datasource.setTvWatchlist(
      accountId: accountId,
      sessionId: sessionId,
      tvId: movieId,
      value: value,
    );
  }
}
