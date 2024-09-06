import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';

class GenericSlideModel extends GenericSlide {
  GenericSlideModel({
    required super.contentType,
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.score,
  });

  factory GenericSlideModel.fromMovieJson(Map<String, dynamic> json) =>
      GenericSlideModel(
        contentType: ContentType.movie,
        id: json["id"] ?? -1,
        imageUrl: json["poster_path"] ?? "https://cdn4.iconfinder.com/data/icons/solid-part-6/128/image_icon-512.png",
        title: json["title"] ?? "(UNTITLED)",
        score: json["vote_average"] ?? 0.0,
      );

  factory GenericSlideModel.fromTvJson(Map<String, dynamic> json) =>
      GenericSlideModel(
        contentType: ContentType.tv,
        id: json["id"] ?? '-1',
        imageUrl: json["poster_path"] ?? "https://cdn4.iconfinder.com/data/icons/solid-part-6/128/image_icon-512.png",
        title: json["name"] ?? "(UNTITLED)",
        score: json["vote_average"] ?? 0.0,
      );

  factory GenericSlideModel.fromPersonJson(Map<String, dynamic> json) =>
      GenericSlideModel(
        contentType: ContentType.person,
        id: json["id"] ?? '-1',
        imageUrl: json["profile_path"] ?? "https://cdn4.iconfinder.com/data/icons/solid-part-6/128/image_icon-512.png",
        title: json["name"] ?? "(NAME NOT GIVEN)",
        score: null,
      );
}
