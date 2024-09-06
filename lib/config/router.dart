import 'package:flutter_tmdb/src/tmdb/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: 'movie/:id',
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';

              return MovieScreen(id: movieId);
            },
            routes: [
              GoRoute(
                path: 'reviews',
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';

                  return ReviewsScreen(
                      id: movieId, contentType: ContentType.movie);
                },
              )
            ]),
        GoRoute(
          path: 'person/:id',
          builder: (context, state) {
            final personId = state.pathParameters['id'] ?? 'no-id';

            return PersonScreen(id: personId);
          },
        ),
        GoRoute(
            path: 'tv/:id',
            builder: (context, state) {
              final tvId = state.pathParameters['id'] ?? 'no-id';

              return TvScreen(id: tvId);
            },
            routes: [
              GoRoute(
                path: 'reviews',
                builder: (context, state) {
                  final tvId = state.pathParameters['id'] ?? 'no-id';

                  return ReviewsScreen(id: tvId, contentType: ContentType.tv);
                },
              )
            ]),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home',
    ),
  ],
);

@riverpod
class HomeIndex extends _$HomeIndex {
  @override
  int build() => 0;

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}
