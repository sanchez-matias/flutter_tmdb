import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/constants/environment.dart';
import 'package:flutter_tmdb/src/tmdb/data/datasources/reviews_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/repositories/reviews_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repo_provider.g.dart';

@riverpod
ReviewsRepositoryImpl reviewsRepository(ReviewsRepositoryRef ref) {
  return ReviewsRepositoryImpl(ReviewsDatasourceImpl(Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.apiKey,
      },
    ),
  )));
}
