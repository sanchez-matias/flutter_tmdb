import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/movie_model.dart';

abstract class MoviesRepository {
  
  Future<List<GenericSlideModel>> getNowPlaying({int page = 1});
  
  Future<List<GenericSlideModel>> getUpcoming({int page = 1});

  Future<List<GenericSlideModel>> getTopRated({int page = 1});

  Future<List<GenericSlideModel>> getTodaysTrending({int page = 1});

  Future<MovieModel> getMovieById(String id);

  Future<List<GenericSlideModel>> getSimilarMovies(String id);
}