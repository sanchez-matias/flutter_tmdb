import 'package:flutter_tmdb/src/tmdb/domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required super.id,
    required super.name,
    required super.username,
    required super.avatarPath,
    required super.raiting,
    required super.content,
    required super.lastUpdated,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json['id'].toString(),
        name: json['author_details']['name'],
        username: json['author_details']['username'],
        avatarPath: json['author_details']['avatar_path'],
        raiting: json['author_details']['raiting'],
        content: json['content'],
        lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated']),
      );
}
