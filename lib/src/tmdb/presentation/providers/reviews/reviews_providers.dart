import 'package:flutter_tmdb/src/tmdb/domain/entities/review.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/reviews/reviews_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_providers.g.dart';

@riverpod
FutureOr<List<Review>> movieReviews(
    MovieReviewsRef ref, String id, int page) async {
  final reviews = await ref
      .read(reviewsRepositoryProvider)
      .getMovieReviews(id: id, page: page);

  return reviews;
}

@riverpod
FutureOr<List<Review>> tvReviews(TvReviewsRef ref, String id) async {
  final reviews =
      await ref.read(reviewsRepositoryProvider).getTvReviews(id: id);

  return reviews;
}

@riverpod
Stream<Review?> movieReviewsSlide(MovieReviewsSlideRef ref, String id) async* {
  final reviews = await ref
      .read(reviewsRepositoryProvider)
      .getMovieReviews(id: id, page: 1);

  if (reviews.isEmpty) {
    yield null;
  }

  await for (final review in Stream<Review>.periodic(const Duration(seconds: 10), (i) => reviews[i])
          .take(reviews.length)) {
    yield review;
  }
}

@riverpod
Stream<Review?> tvReviewsSlide(TvReviewsSlideRef ref, String id) async* {
  final reviews = await ref
      .read(reviewsRepositoryProvider)
      .getTvReviews(id: id, page: 1);

  if (reviews.isEmpty) {
    yield null;
  }

  await for (final review
      in Stream<Review>.periodic(const Duration(seconds: 10), (i) => reviews[i])
          .take(reviews.length)) {
    yield review;
  }
}
