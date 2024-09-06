import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/people/people_providers.dart';
import 'package:go_router/go_router.dart';

class ActorsView extends ConsumerStatefulWidget {
  const ActorsView({super.key});

  @override
  ConsumerState<ActorsView> createState() => _ActorsViewState();
}

class _ActorsViewState extends ConsumerState<ActorsView> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    ref.read(popularPeopleProvider.notifier).loadNextPage();
    controller.addListener(
      () {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 100) {
          ref.read(popularPeopleProvider.notifier).loadNextPage();
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popularPeople = ref.watch(popularPeopleProvider);

    return CustomScrollView(
      controller: controller,
      slivers: [
        const SliverAppBar(
          title: Text('Popular People'),
          centerTitle: true,
          pinned: true,
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            mainAxisExtent: 250,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: popularPeople.length,
            (context, index) {
              final slide = popularPeople[index];

              return _CustomSlide(slide);
            },
          ),
        )
      ],
    );
  }
}

class _CustomSlide extends StatelessWidget {
  final GenericSlide slide;

  const _CustomSlide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          context.push('/home/${slide.route}');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                height: 160,
                width: 110,
                placeholderFit: BoxFit.none,
                placeholder: const AssetImage('assets/loaders/loading.gif'),
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${slide.imageUrl}'),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.network(
                  'https://luminaconstruction.com/assets/images/noimage.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              slide.title,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
