import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_season.dart';

class TvSeasonModel extends TvSeason {
  TvSeasonModel({
    required super.airDate,
    required super.numberOfEpisodes,
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.seasonNumber,
    required super.seriesId,
    required super.voteAverage,
  });

  factory TvSeasonModel.fromJson(Map<String, dynamic> json) => TvSeasonModel(
        airDate: json['air_date'] != null
          ? DateTime.parse(json['air_date'])
          : null,
        numberOfEpisodes: json['episode_count'],
        id: json['id'].toString(),
        name: json['name'] ?? '(UNTITLED)',
        overview: json['overview'] ?? 'No description given',
        posterPath: json['poster_path'] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        seasonNumber: json['season_number'],
        seriesId: json['id'].toString(),
        voteAverage: json['vote_average'] ?? 0,
      );
  
  Map<String, dynamic> toMap() => {
    'airDate': airDate,
    'numberOfEpisodes': numberOfEpisodes,
    'id': id,
    'name': name,
    'overview': overview,
    'posterPath': posterPath,
    'seasonNumber': seasonNumber,
    'voteAverage': voteAverage,
  };
}
