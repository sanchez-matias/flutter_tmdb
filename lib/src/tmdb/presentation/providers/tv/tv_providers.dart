// ignore_for_file: avoid_public_notifier_properties
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_providers.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_repo_provider.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_episode.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_series.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/tv/tv_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_providers.g.dart';

@riverpod
bool tvInitialLoading(TvInitialLoadingRef ref) {
  final step1 = ref.watch(airingTodayProvider).isEmpty;
  final step2 = ref.watch(onTheAirProvider).isEmpty;
  final step3 = ref.watch(todaysTrendingTvProvider).isEmpty;
  final step4 = ref.watch(topRatedTvProvider).isEmpty;
  
  if (step1 || step2 || step3 || step4) return true;

  return false;
}

@Riverpod(keepAlive: true)
FutureOr<TvSeries> tvSeries(TvSeriesRef ref, String id) async {
  final series = await ref.read(tvRepositoryProvider).getTvSeriesById(id);
  return series;
}

@riverpod
FutureOr<List<GenericSlide>> similarSeries(SimilarSeriesRef ref, String id) async {
  final similarSeries = ref.read(tvRepositoryProvider).getSimilarSeries(id: id);
  
  return similarSeries;
}

@riverpod
FutureOr<List<TvEpisode>> tvEpisodes(TvEpisodesRef ref, String id, int season) async {
  final episodes = await ref.read(tvRepositoryProvider).getSeasonEpisodes(tvId: id, season: season);

  return episodes;
}

@riverpod
class AiringToday extends _$AiringToday {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final series = await ref.read(tvRepositoryProvider).getAirigToday(page: page);
    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class OnTheAir extends _$OnTheAir {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final series = await ref.read(tvRepositoryProvider).getOnTheAir(page: page);
    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class TodaysTrendingTv extends _$TodaysTrendingTv {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final series = await ref.read(tvRepositoryProvider).getTodaysTrending(page: page);
    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class TopRatedTv extends _$TopRatedTv {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final series = await ref.read(tvRepositoryProvider).getTopRated(page: page);
    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class RatedTv extends _$RatedTv {
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

    final series = await ref.read(tvRepositoryProvider).getRatedTv(
          accountId: user.id,
          sessionId: authState.sessionId!,
          page: page,
        );

    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class FavoriteTv extends _$FavoriteTv {
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

    final series = await ref.read(tvRepositoryProvider).getFavoriteTv(
          accountId: user.id,
          sessionId: authState.sessionId!,
          page: page,
        );

    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class TvWatchlist extends _$TvWatchlist {
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

    final series = await ref.read(tvRepositoryProvider).getWatchlistTv(
          accountId: user.id,
          sessionId: authState.sessionId!,
          page: page,
        );

    state = [
      ...state,
      ...series,
    ];

    isLoading = false;
  }
}

@riverpod
class TvAccountState extends _$TvAccountState {
  @override
  FutureOr<TitleAccountState> build(String tvId) async {
    final authState = ref.watch(authenticationProvider);

    final movieAccountState = await ref.read(tvRepositoryProvider).getTvAccountState(
              sessionId: authState.sessionId!,
              movieId: tvId,
            );

    return movieAccountState;
  }

  Future<void> toggleTvFavorite() async {
    final authState = ref.watch(authenticationProvider);

    if (authState.isGuest || authState.sessionId == null) return;

    final user = await ref.watch(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);
 
    final movieState = await future;

    await ref.read(tvRepositoryProvider).setTvFavorite(
            accountId: user.id,
            sessionId: authState.sessionId!,
            movieId: tvId,
            value: !movieState.isFavorite,
          );

    ref.invalidateSelf();
  }

  Future<void> toggleTvWatchlist() async {
    final authState = ref.watch(authenticationProvider);

    if (authState.isGuest || authState.sessionId == null) return;

    final user = await ref.watch(authRepositoryProvider)
      .getUserDetails(authState.sessionId!);
 
    final movieState = await future;

    await ref.read(tvRepositoryProvider).setTvWatchlist(
            accountId: user.id,
            sessionId: authState.sessionId!,
            movieId: tvId,
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

    await ref.read(tvRepositoryProvider).castTvRaiting(
          sessionId: authState.sessionId!,
          tvId: tvId,
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

    await ref.read(tvRepositoryProvider).deleteTvRaiting(
          sessionId: authState.sessionId!,
          tvId: tvId,
        );
    
    ref.invalidateSelf();
  }
}
