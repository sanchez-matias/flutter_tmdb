import 'package:flutter/material.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/custom_fade_image.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class RecomendationsSection extends StatelessWidget {
  final AsyncValue<List<GenericSlide>> slides;

  const RecomendationsSection({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Similar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        Center(
          child: slides.when(
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator.adaptive(),
            data: (slides) {
              if (slides.isEmpty) {
                return const SizedBox();
              }

              return Table(
                children: List.generate(
                  4,
                  (column) => TableRow(
                    children: List.generate(
                      3,
                      (row) => _RecomentadionsSlide(slides[(3 * column) + row]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RecomentadionsSlide extends StatelessWidget {
  final GenericSlide slide;

  const _RecomentadionsSlide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushReplacement('/home/${slide.route}');
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              CustomFadeImage(
                imagePath: slide.imageUrl,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
