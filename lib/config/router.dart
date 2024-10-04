import 'package:flutter/material.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_tmdb/src/auth/presentation/screens/loading_screen.dart';
import 'package:flutter_tmdb/src/auth/presentation/screens/login_screen.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/screens/screens.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authStateNotifier = ValueNotifier(AuthStatus.checking);

  ref
    ..onDispose(authStateNotifier.dispose)
    ..listen(
      authenticationProvider,
      (_, next) {
        authStateNotifier.value = next.status;
      },
    );

  final router = GoRouter(
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
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
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final actualRoute = state.matchedLocation;
      final authState = ref.watch(authenticationProvider).status;

      if (authState == AuthStatus.checking) {
        return AuthStatus.checking.route;
      }

      if (authState == AuthStatus.notAuthenticated && actualRoute != AuthStatus.notAuthenticated.route) {
        return AuthStatus.notAuthenticated.route;
      }

      if (authState == AuthStatus.authenticated && actualRoute != AuthStatus.authenticated.route) {
        if (actualRoute.contains('/home')) return null;
        return AuthStatus.authenticated.route;
      }

      return null;
    },
  );

  ref.onDispose(router.dispose);
  return router;
}

class MenuDestination {
  final String name;
  final IconData iconData;
  final Widget child;

  MenuDestination({
    required this.name,
    required this.iconData,
    required this.child,
  });
}

@riverpod
List<MenuDestination> drawerDestinations(DrawerDestinationsRef ref) => [
        MenuDestination(
          name: 'Movies',
          iconData: Icons.movie,
          child: const MoviesView(),
        ),
        MenuDestination(
          name: 'TV',
          iconData: Icons.tv,
          child: const TvView(),
        ),
        MenuDestination(
          name: 'Popular People',
          iconData: Icons.people,
          child: const ActorsView(),
        ),
        MenuDestination(
          name: 'Rated Movies',
          iconData: Icons.star_rate_rounded,
          child: const RatedMoviesView(),
        ),
        MenuDestination(
          name: 'Rated TV',
          iconData: Icons.star_rate_rounded,
          child: const RatedTvView(),
        ),
        MenuDestination(
          name: 'Favorite Movies',
          iconData: Icons.favorite,
          child: const FavoriteMoviesView(),
        ),
        MenuDestination(
          name: 'Favorite TV',
          iconData: Icons.favorite,
          child: const FavoriteTvView(),
        ),
        MenuDestination(
          name: 'Movies Watchlist',
          iconData: Icons.remove_red_eye,
          child: const WatchlistMoviesView(),
        ),
        MenuDestination(
          name: 'TV Watchlist',
          iconData: Icons.remove_red_eye,
          child: const WatchlistTvView(),
        ),
        
      ];

@riverpod
class HomeIndex extends _$HomeIndex {
  @override
  int build() => 0;

  void changeIndex(int newIndex) {
    state = newIndex;
  }
}
