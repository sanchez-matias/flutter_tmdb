import 'package:flutter/material.dart';
import 'package:flutter_tmdb/core/helpers/human_formats.dart';

class ColoredScore extends StatelessWidget {
  final double? score;

  const ColoredScore({super.key, required this.score});

  Color? get scoreColor {
    if (score == null) return null;

    return Color.lerp(
          Colors.red.shade900,
          Colors.green.shade800,
          score! / 10,
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star_rounded,
          color: scoreColor,
        ),
        const SizedBox(width: 5),
        Text(HumanFormats.number(score!, 1), style: TextStyle(color: scoreColor)),
      ],
    ));
  }
}
