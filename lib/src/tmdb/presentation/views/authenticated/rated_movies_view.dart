import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/vertical_list_view.dart';

class RatedMoviesView extends ConsumerStatefulWidget {
  const RatedMoviesView({super.key});

  @override
  ConsumerState<RatedMoviesView> createState() => _RatedMoviesViewState();
}

class _RatedMoviesViewState extends ConsumerState<RatedMoviesView> {
  @override
  void initState() {
    super.initState();
    ref.read(ratedMoviesProvider.notifier).loadNextPage();
  }

@override
  Widget build(BuildContext context) {
    final slides = ref.watch(ratedMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rated Movies'),
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
        loadNextPage: ref.watch(ratedMoviesProvider.notifier).loadNextPage,
      ),
    );
  }
}