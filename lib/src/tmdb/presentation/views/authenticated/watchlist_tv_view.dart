import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/vertical_list_view.dart';

class WatchlistTvView extends ConsumerWidget {
  const WatchlistTvView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slides = ref.watch(tvWatchlistProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('TV Watchlist'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
      ),
      body: VerticalListView(
        slides: slides,
        loadNextPage: ref.read(tvWatchlistProvider.notifier).loadNextPage,
      ),
    );
  }
}
