import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/custom_slide.dart';

class HorizontalLisViewCard extends StatelessWidget {
  final AsyncValue<List<GenericSlide>> slides;
  final String title;
  final double height;

  const HorizontalLisViewCard({
    super.key,
    required this.slides,
    required this.title,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: slides.when(
                error: (error, stackTrace) => const Center(
                  child: Text('Sorry! We could not obtain this data.'),
                ),
                loading: () => const Center(child: Text('Loading...')),
                data: (data) {
                  if (data.isEmpty) {
                    return const Center(
                      child: Text('No data aviable'),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) =>
                          CustomSlide(slide: data[index], height: 240));
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
