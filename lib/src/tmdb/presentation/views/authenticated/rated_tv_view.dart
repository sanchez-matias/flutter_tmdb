import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/vertical_list_view.dart';

class RatedTvView extends ConsumerStatefulWidget {
  const RatedTvView({super.key});

  @override
  ConsumerState<RatedTvView> createState() => _RatedTvViewState();
}

class _RatedTvViewState extends ConsumerState<RatedTvView> {
  @override
  void initState() {
    super.initState();
    ref.read(ratedTvProvider.notifier).loadNextPage();
  }

@override
  Widget build(BuildContext context) {
    final slides = ref.watch(ratedTvProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rated TV'),
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
        loadNextPage: ref.read(ratedTvProvider.notifier).loadNextPage,
      ),
    );
  }
}
