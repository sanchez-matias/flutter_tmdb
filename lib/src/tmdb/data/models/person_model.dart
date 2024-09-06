import 'package:flutter_tmdb/src/tmdb/domain/entities/person.dart';

class PersonModel extends Person {
  PersonModel({
    required super.adult,
    required super.alsoKnownAs,
    required super.biography,
    required super.birthday,
    required super.deathday,
    required super.gender,
    required super.homepage,
    required super.id,
    required super.knownForDeparment,
    required super.name,
    required super.placeOfBirth,
    required super.popularity,
    required super.profilePath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        adult: json['adult'] ?? false,
        alsoKnownAs: json['also_known_as'] == null  
          ? []
          : List<String>.from(json['also_known_as'].map((e) => e.toString())),
        biography: json['biography'] ?? '',
        birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday']),
        deathday: json['deathday'] == null
          ? null
          : DateTime.parse(json['deathday']),
        gender: json['gender'],
        homepage: json['homepage'] ?? '',
        id: json['id'].toString(),
        knownForDeparment: json['known_for_department'] ?? '',
        name: json['name'] ?? '(UNKNOWN)',
        placeOfBirth: json['place_of_birth'] ?? '(UNKNOWN)',
        popularity: json['popularity'],
        profilePath: json['profile_path'] ?? 'https://luminaconstruction.com/assets/images/noimage.png',
      );
}
