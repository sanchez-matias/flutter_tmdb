import 'package:flutter/material.dart';

class CustomFadeImage extends StatelessWidget {
  final String imagePath;
  final double height;

  const CustomFadeImage({
    super.key,
    required this.imagePath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage(
          height: height,
          width: height * 0.65,
          fit: BoxFit.fitHeight,
          placeholderFit: BoxFit.none,
          placeholder: const AssetImage('assets/loaders/loading_stars.gif'),
          image: NetworkImage('https://image.tmdb.org/t/p/w500$imagePath'),
          imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/loaders/no_image.png',
                fit: BoxFit.fitWidth,
                width: height * 0.65,
                height: height,
              )),
    );
  }
}
