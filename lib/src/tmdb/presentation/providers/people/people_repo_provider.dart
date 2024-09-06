

import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/constants/environment.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/people_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/repositories/people_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'people_repo_provider.g.dart';

@riverpod
PeopleRepositoryImpl peopleRepository(PeopleRepositoryRef ref) {
  return PeopleRepositoryImpl(PeopleDatasourceImpl(Dio(
    BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          queryParameters: {
            'api_key': Environment.apiKey,
          }
        ),
  )));
}