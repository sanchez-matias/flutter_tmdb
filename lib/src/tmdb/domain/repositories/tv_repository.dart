import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/review_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_episode_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/tv_model.dart';

abstract class TvRepository {
  Future<List<GenericSlideModel>> getAirigToday({int page = 1});

  Future<List<GenericSlideModel>> getOnTheAir({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1});

  Future<TvSeriesModel> getTvSeriesById(String id);

  Future<List<ReviewModel>> getTvReviews({required String id, int page = 1});

  Future<List<GenericSlideModel>> getSimilarSeries({required String id, int page = 1});

  Future<List<TvEpisodeModel>> getSeasonEpisodes({required String tvId, required int season});
}
