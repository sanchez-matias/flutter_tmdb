import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/constants/environment.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/tv_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/repositories/tv_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_repo_provider.g.dart';

@riverpod
TvRepositoryImpl tvRepository(TvRepositoryRef ref) {
  return TvRepositoryImpl(TvDatasourceImpl(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        queryParameters: {
          'api_key': Environment.apiKey,
        },
      ),
    ),
  ));
}
