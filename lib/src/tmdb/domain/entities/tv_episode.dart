class TvEpisode {
  final DateTime? airDate;
  final int episodeNumber;
  final String episodeType;
  final int id;
  final String name;
  final String overview;
  final int? runtime;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  TvEpisode({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });
}
