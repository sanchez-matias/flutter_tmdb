import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/tv/tv_providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';

class TvView extends ConsumerStatefulWidget {
  const TvView({super.key});

  @override
  ConsumerState<TvView> createState() => _TvViewState();
}

class _TvViewState extends ConsumerState<TvView> {
  @override
  void initState() {
    super.initState();
    ref.read(airingTodayProvider.notifier).loadNextPage();
    ref.read(onTheAirProvider.notifier).loadNextPage();
    ref.read(todaysTrendingTvProvider.notifier).loadNextPage();
    ref.read(topRatedTvProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(tvInitialLoadingProvider);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    final airingToday = ref.watch(airingTodayProvider);
    final onTheAir = ref.watch(onTheAirProvider);
    final todaysTrending = ref.watch(todaysTrendingTvProvider);
    final topRated = ref.watch(topRatedTvProvider);

    return CustomScrollView(slivers: [
      const CustomAppbar(title: 'TV'),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Column(
          children: [
            HorizontalListView(
              title: 'Today\'s Trending',
              subtitle: 'Most popular series today',
              slides: todaysTrending,
              loadNextPage: ref.read(todaysTrendingTvProvider.notifier).loadNextPage,
            ),

            HorizontalListView(
              title: 'Airing Today',
              subtitle: 'Unfinished series waiting for you',
              slides: airingToday,
              loadNextPage: ref.read(airingTodayProvider.notifier).loadNextPage,
            ),

            HorizontalListView(
              title: 'Newest',
              subtitle: 'Get the most recently released and upcoming series',
              slides: onTheAir,
              loadNextPage: ref.read(onTheAirProvider.notifier).loadNextPage,
            ),
            
            HorizontalListView(
              title: 'Top Rated',
              subtitle: 'The most loved of all time',
              slides: topRated,
              loadNextPage: ref.read(topRatedTvProvider.notifier).loadNextPage,             
            ),
          ],
        ),
        childCount: 1,
      ))
    ]);
  }
}
