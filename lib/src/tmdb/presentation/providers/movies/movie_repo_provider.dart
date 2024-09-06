import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/constants/environment.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/movies_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/repositories/movie_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repo_provider.g.dart';

@Riverpod(keepAlive: true)
MoviesRepositoryImpl movieRepositoy(MovieRepositoyRef ref) {

  return MoviesRepositoryImpl(
    MoviesDatasourceImpl(
      Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          queryParameters: {
            'api_key': Environment.apiKey,
          }
        ),
      ),
    ),
  );
}


