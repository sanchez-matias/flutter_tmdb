import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_episode.dart';

class TvEpisodeModel extends TvEpisode {
  TvEpisodeModel({
    required super.airDate,
    required super.episodeNumber,
    required super.episodeType,
    required super.id,
    required super.name,
    required super.overview,
    required super.runtime,
    required super.stillPath,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) => TvEpisodeModel(
        airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date']),
        episodeNumber: json['episode_number'],
        episodeType: json['episode_type'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        runtime: json['runtime'],
        stillPath: json['still_path'] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );
}