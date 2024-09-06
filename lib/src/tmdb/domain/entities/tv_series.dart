import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_season.dart';

class TvSeries {
  final bool adult;
  final String backdropPath;
  final List<String> createdBy;
  final DateTime? firsAirDate;
  final List<String> genres;
  final String? homepage;
  final String id;
  final bool inProduction;
  final DateTime? lastAirDate;
  final String name;
  final String originalName;
  final List<String> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String originCountry;
  final String originalLanguage;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<String> productionCompanies;
  final List<String> productionCountries;
  final List<TvSeason> seasons;
  final String status;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  TvSeries({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.firsAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.name,
    required this.originalName,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });
}
