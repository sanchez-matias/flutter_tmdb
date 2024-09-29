import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/vertical_list_view.dart';

class FavoriteMoviesView extends ConsumerWidget {
  const FavoriteMoviesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slides = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
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
        loadNextPage: ref.read(favoriteMoviesProvider.notifier).loadNextPage,
      ),
    );
  }
}
