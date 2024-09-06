import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';

class MoviesView extends ConsumerStatefulWidget {
  const MoviesView({super.key});

  @override
  ConsumerState<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends ConsumerState<MoviesView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(todaysTrendingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(intialLoadingProvider);
    if (initialLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final todaysTrending = ref.watch(todaysTrendingProvider);

    return CustomScrollView(slivers: [
      const CustomAppbar(title: 'Movies'),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Column(
          children: [

            HorizontalListView(
              title: 'Today\'s Trending',
              subtitle: 'Most popular movies today',
              slides: todaysTrending,
              loadNextPage: ref.read(todaysTrendingProvider.notifier).loadNextPage,
            ),

            HorizontalListView(
              title: 'Now Playing',
              subtitle: 'Recently released movies',
              slides: nowPlayingMovies,
              loadNextPage: ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
            ),

            HorizontalListView(
              title: 'Coming Soon',
              subtitle: 'Soon aviable on theaters',
              slides: upcomingMovies,
              loadNextPage: ref.read(upcomingMoviesProvider.notifier).loadNextPage,
            ),

            HorizontalListView(
              title: 'Top Rated',
              subtitle: 'Most liked of all time',
              slides: topRatedMovies,
              loadNextPage: ref.read(topRatedMoviesProvider.notifier).loadNextPage,
            ),
            const SizedBox(height: 50),
          ],
        ),
        childCount: 1,
      ))
    ]);
  }
}
