import 'package:flutter/material.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/custom_fade_image.dart';
import 'package:go_router/go_router.dart';

class VerticalListView extends StatefulWidget {
  final List<GenericSlide> slides;
  final VoidCallback loadNextPage;

  const VerticalListView({
    super.key,
    required this.slides,
    required this.loadNextPage,
  });

  @override
  State<VerticalListView> createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(
      () {
        if (controller.position.pixels + 200 >=
            controller.position.maxScrollExtent) {
          widget.loadNextPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: widget.slides.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) => _ListViewSlide(widget.slides[index]),
    );
  }
}

class _ListViewSlide extends StatelessWidget {
  final GenericSlide slide;

  const _ListViewSlide(this.slide);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => context.push('/home/${slide.route}'),
      child: Center(
        child: CustomFadeImage(
          imagePath: slide.imageUrl,
          height: 200,
        ),
      ),
    );
  }
}
