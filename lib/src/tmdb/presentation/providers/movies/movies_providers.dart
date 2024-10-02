// ignore_for_file: avoid_public_notifier_properties
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_repo_provider.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/movie.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/movies/movie_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_providers.g.dart';

@riverpod
bool intialLoading(IntialLoadingRef ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step3 = ref.watch(upcomingMoviesProvider).isEmpty;
  final step4 = ref.watch(todaysTrendingProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false;
}

@Riverpod(keepAlive: true)
Future<Movie> getMovieById(GetMovieByIdRef ref, String id) async {
  final movie = await ref.read(movieRepositoyProvider).getMovieById(id);

  return movie;
}

@riverpod
FutureOr<List<GenericSlide>> similarMovies(SimilarMoviesRef ref, String id) async {
  final similar = await ref.read(movieRepositoyProvider).getSimilarMovies(id);
  
  return similar;
}

@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final movies = await ref.read(movieRepositoyProvider).getNowPlaying(page: page);
    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class TopRatedMovies extends _$TopRatedMovies {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final movies = await ref.read(movieRepositoyProvider).getTopRated(page: page);

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class UpcomingMovies extends _$UpcomingMovies {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final movies = await ref.read(movieRepositoyProvider).getUpcoming(page: page);

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class TodaysTrending extends _$TodaysTrending {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final movies = await ref.read(movieRepositoyProvider).getTodaysTrending(page: page);

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class RatedMovies extends _$RatedMovies {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final authState = ref.read(authenticationProvider);
    final user = await ref.read(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);

    final movies = await ref.read(movieRepositoyProvider).getRatedMovies(
      accountId: user.id,
      sessionId: authState.sessionId!,
      page: page,
    );

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class FavoriteMovies extends _$FavoriteMovies {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final authState = ref.read(authenticationProvider);
    final user = await ref.read(authRepositoryProvider)
        .getUserDetails(authState.sessionId!);

    final movies = await ref.read(movieRepositoyProvider).getFavoriteMovies(
          accountId: user.id,
          sessionId: authState.sessionId!,
          page: page,
        );

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class MoviesWatchlist extends _$MoviesWatchlist {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final authState = ref.read(authenticationProvider);
    final user = await ref.read(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);

    final movies = await ref.read(movieRepositoyProvider).getWatchlistMovies(
      accountId: user.id,
      sessionId: authState.sessionId!,
      page: page,
    );

    state = [
      ...state,
      ...movies,
    ];

    isLoading = false;
  }
}

@riverpod
class MovieAccountState extends _$MovieAccountState {
  @override
  FutureOr<TitleAccountState> build(String movieId) async {
    final authState = ref.watch(authenticationProvider);

    final movieAccountState = await ref.read(movieRepositoyProvider).getMovieAccountState(
              sessionId: authState.sessionId!,
              movieId: movieId,
            );

    return movieAccountState;
  }

  Future<void> toggleMovieFavorite() async {
    final authState = ref.read(authenticationProvider);

    if (authState.isGuest || authState.sessionId == null) return;

    final user = await ref.watch(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);
 
    final movieState = await future;

    await ref.read(movieRepositoyProvider).setMovieFavorite(
            accountId: user.id,
            sessionId: authState.sessionId!,
            movieId: movieId,
            value: !movieState.isFavorite,
          );

    ref.invalidateSelf();
  }

  Future<void> toggleMovieWatchlist() async {
    final authState = ref.read(authenticationProvider);

    if (authState.isGuest || authState.sessionId == null) return;

    final user = await ref.read(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);
 
    final movieState = await future;

    await ref.read(movieRepositoyProvider).setMovieWatchlist(
            accountId: user.id,
            sessionId: authState.sessionId!,
            movieId: movieId,
            value: !movieState.isInWatchlist,
          );
    
    ref.invalidateSelf();
  }

  Future<void> castRaiting(int raiting) async {
    final authState = ref.read(authenticationProvider);

    if (authState.isGuest) {
     // TODO: handle the raiting for guests.
     return; 
    }

    await ref.read(movieRepositoyProvider).castMovieRaiting(
          sessionId: authState.sessionId!,
          movieId: movieId,
          value: raiting,
        );

    ref.invalidateSelf();
  }

  Future<void> deleteRaiting() async {
    final authState = ref.read(authenticationProvider);

    if (authState.isGuest) {
      // TODO: handle the raiting for guests.
      return;
    }

    await ref.read(movieRepositoyProvider).deleteMovieRaiting(
          sessionId: authState.sessionId!,
          movieId: movieId,
        );
    
    ref.invalidateSelf();
  }
}
