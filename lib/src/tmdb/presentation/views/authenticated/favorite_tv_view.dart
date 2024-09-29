
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/vertical_list_view.dart';

class FavoriteTvView extends ConsumerWidget {
  const FavoriteTvView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slides = ref.watch(favoriteTvProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite TV'),
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
        loadNextPage: ref.read(favoriteTvProvider.notifier).loadNextPage,
      ),
    );
  }
}