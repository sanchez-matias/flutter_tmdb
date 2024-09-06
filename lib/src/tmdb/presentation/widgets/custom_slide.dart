import 'package:flutter/material.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/colored_score.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/custom_fade_image.dart';
import 'package:go_router/go_router.dart';

class CustomSlide extends StatelessWidget {
  final GenericSlide slide;
  final double height;

  const CustomSlide({
    super.key,
    required this.slide,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          context.push('/home/${slide.route}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFadeImage(
              imagePath: slide.imageUrl,
              height: height * 0.75,
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: height * 0.5,
              child: Text(
                slide.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const Spacer(),
            
            slide.score == null
              ? const SizedBox()
              : ColoredScore(score: slide.score)
          ],
        ),
      ),
    );
  }
}
