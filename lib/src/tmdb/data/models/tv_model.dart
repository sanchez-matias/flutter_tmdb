import 'package:flutter_tmdb/src/tmdb/data/models/tv_season_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_season.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_series.dart';

class TvSeriesModel extends TvSeries {
  TvSeriesModel({
    required super.adult,
    required super.backdropPath,
    required super.createdBy,
    required super.firsAirDate,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.inProduction,
    required super.lastAirDate,
    required super.name,
    required super.originalName,
    required super.networks,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originCountry,
    required super.originalLanguage,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.seasons,
    required super.status,
    required super.tagline,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) => TvSeriesModel(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        createdBy: json['created_by'] != null
          ? List<String>.from(json['created_by'].map((x) => x['name']))
          : [],
        firsAirDate: json['first_air_date'] != null
          ? DateTime.parse(json['first_air_date'])
          : null,
        genres: json['genres'] != null
          ? List<String>.from(json['genres'].map((x) => x['name']))
          : [],
        homepage: json['homepage'],
        id: json['id'].toString(),
        inProduction: json['in_production'] ?? false,
        lastAirDate: json['last_air_date'] != null
          ? DateTime.parse(json['last_air_date'])
          : null,
        name: json['name'] ?? '(UNTITLED)',
        originalName: json['original_name'] ?? '(UNTITLED)',
        networks: json['networks'] != null
          ? List<String>.from(json['networks'].map((x) => x['name']))
          : [],
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
        originCountry: json['origin_country'][0] ?? 'Not provided',
        originalLanguage: json['original_language'],
        overview: json['overview'] ?? 'No description provided',
        popularity: json['popularity'],
        posterPath: json['poster_path'] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
        productionCompanies: json['production_companies'] != null
          ? List<String>.from(json['production_companies'].map((x) => x['name']))
          : [],
        productionCountries: json['production_countries'] != null
          ? List<String>.from(json['production_countries'].map((x) => x['name']))
          : [],
        seasons: List<TvSeason>.from(json['seasons'].map((x) => TvSeasonModel.fromJson(x))),
        status: json['status'] ?? 'Unknown',
        tagline: json['tagline'] ?? 'Not Provided',
        voteAverage: json['vote_average'] ?? 0,
        voteCount: json['vote_count'] ?? 0,
      );

  Map<String, dynamic> toMap() => {
    "adult": adult, 
    "backdropPath": backdropPath, 
    "createdBy": createdBy, 
    "firsAirDate": firsAirDate, 
    "genres": genres, 
    "homepage": homepage, 
    "id": id, 
    "inProduction": inProduction, 
    "lastAirDate": lastAirDate, 
    "name": name, 
    "originalName": originalName, 
    "networks": networks, 
    "numberOfEpisodes": numberOfEpisodes, 
    "numberOfSeasons": numberOfSeasons, 
    "originCountry": originCountry, 
    "originalLanguage": originalLanguage, 
    "overview": overview, 
    "popularity": popularity, 
    "posterPath": posterPath, 
    "productionCompanies": productionCompanies, 
    "productionCountries": productionCountries, 
    "seasons": seasons, 
    "status": status, 
    "tagline": tagline, 
    "voteAverage": voteAverage, 
    "voteCount": voteCount, 
  };

}
