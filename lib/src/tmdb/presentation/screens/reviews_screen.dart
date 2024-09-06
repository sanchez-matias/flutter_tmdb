import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/review.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';

enum ContentType { movie, tv }

class ReviewsScreen extends ConsumerWidget {
  final String id;
  final ContentType contentType;

  const ReviewsScreen({
    super.key,
    required this.id,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsProvider = contentType == ContentType.movie
        ? ref.watch(movieReviewsProvider(id, 1))
        : ref.watch(tvReviewsProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: reviewsProvider.when(
            error: (error, stackTrace) => const Text('An Error has Occurred'),
            loading: () => const CircularProgressIndicator.adaptive(),
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final review = data[index];

                  return ReviewTile(review: review);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: size.width * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User data
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${review.avatarPath}')),
                const SizedBox(width: 15),
                Text(
                  review.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(review.content, textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}
