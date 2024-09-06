import 'package:flutter_tmdb/src/tmdb/data/datasources/people_datasource.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/generic_slide_model.dart';
import 'package:flutter_tmdb/src/tmdb/data/models/person_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/repositories/people_repository.dart';

class PeopleRepositoryImpl extends PeopleRepository {
  final PeopleDatasource _datasource;

  PeopleRepositoryImpl(this._datasource);

  @override
  Future<List<GenericSlideModel>> getMovieCasting({required String id, int page = 1}) {
    return _datasource.getMovieCasting(id: id, page: page);
  }

  @override
  Future<List<GenericSlideModel>> getPopularPeople({int page = 1}) {
    return _datasource.getPopularPeople(page: page);
  }

  @override
  Future<List<GenericSlideModel>> getTvCasting({required String id, int page = 1}) {
    return _datasource.getTvCasting(id: id, page: page);
  }

  @override
  Future<PersonModel> getPersonById(String id) {
    return _datasource.getPersonById(id);
  }
  
  @override
  Future<List<GenericSlideModel>> getPersonParticipations(String personId) {
    return _datasource.getPersonParticipations(personId);
  }
}
