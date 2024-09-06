import 'package:flutter_tmdb/src/tmdb/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.belongsToCollection,
    required super.budget,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        belongsToCollection: json["belongs_to_collection"] == null
          ? ''
          : json["belongs_to_collection"]["name"],
        budget: json["budget"] ?? 0,
        genres: List<String>.from(json["genres"].map((x) => x["name"])),
        homepage: json["homepage"] ?? '',
        id: json["id"].toString(),
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"]?.toDouble() ?? 0,
        posterPath: json["poster_path"] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        productionCompanies: List.empty(),
        releaseDate: json["release_date"] != null &&
                json["release_date"].toString().isNotEmpty
            ? DateTime.parse(json["release_date"])
            : null,
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: json["vote_average"]?.toDouble() ?? 0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdropPath": backdropPath,
    "belongsToCollection": belongsToCollection,
    "budget": budget,
    "genres": genres,
    "homepage": homepage,
    "id": id,
    "originalLanguage": originalLanguage,
    "originalTitle": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "posterPath": posterPath,
    "productionCompanies": productionCompanies,
    "releaseDate": releaseDate,
    "revenue": revenue,
    "runtime": runtime,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "voteAverage": voteAverage,
    "voteCount": voteCount,
  };
}
