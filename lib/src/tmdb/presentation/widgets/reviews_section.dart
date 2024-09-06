import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/review.dart';
import 'package:go_router/go_router.dart';

class ReviewsSection extends StatelessWidget {
  final AsyncValue<Review?> reviews;
  final String screenPath;

  const ReviewsSection({super.key, required this.reviews, required this.screenPath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Row(
            children: [
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Rate this title'),
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
        SizedBox( 
          height: size.height * 0.2,
          child: Center(
            child: reviews.when(
              error: (error, stackTrace) => const Text('There was an error loading the reviews'),
              loading: () => const Text('Loading reviews...'),
              data: (data) {
                if (data == null) {
                  return const Text('There is no reviews for this title.');
                }

                return GestureDetector(
                  onTap: () {
                    context.push(screenPath);
                  },
                  child: SizedBox(
                    width: size.width * 0.85,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundImage: data.avatarPath == null
                                  ? null
                                  : NetworkImage('https://image.tmdb.org/t/p/w500${data.avatarPath}')),
                            const SizedBox(width: 15),
                            Text(
                              data.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.content,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
