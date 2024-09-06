
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/person.dart';

abstract class PeopleRepository {
  Future<List<GenericSlideModel>> getPopularPeople({int page = 1});

  Future<List<GenericSlideModel>> getMovieCasting({
    required String id,
    int page = 1,
  });

  Future<List<GenericSlideModel>> getTvCasting({
    int page = 1,
    required String id,
  });

  Future<List<GenericSlideModel>> getPersonParticipations(String personId);

  Future<Person> getPersonById(String id);
}
