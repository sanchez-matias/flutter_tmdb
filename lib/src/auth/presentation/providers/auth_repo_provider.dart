import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/constants/environment.dart';
import 'package:flutter_tmdb/src/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_tmdb/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo_provider.g.dart';

@riverpod
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(AuthDatasourceImpl(Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.apiKey
      },
    ),
  )));
}
