class TvSeason {
  final DateTime? airDate;
  final int numberOfEpisodes;
  final String id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final String seriesId;
  final double voteAverage;

  TvSeason({
    required this.airDate,
    required this.numberOfEpisodes,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.seriesId,
    required this.voteAverage,
  });
}