// ignore_for_file: avoid_public_notifier_properties
import 'package:flutter_tmdb/src/tmdb/data/models/person_model.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/generic_slide.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/people/people_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'people_providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<GenericSlide>> movieCasting(MovieCastingRef ref, String id) async {
  final casting = await ref.read(peopleRepositoryProvider).getMovieCasting(id: id);

  return casting;
}

@Riverpod(keepAlive: true)
FutureOr<List<GenericSlide>> tvCasting(TvCastingRef ref, String id) async {
  final casting = ref.read(peopleRepositoryProvider).getTvCasting(id: id);

  return casting;
}

@Riverpod(keepAlive: true)
FutureOr<PersonModel> personById(PersonByIdRef ref, String id) async {
  final person = await ref.read(peopleRepositoryProvider).getPersonById(id);

  return person;

}

@Riverpod(keepAlive: true)
FutureOr<List<GenericSlide>> personParticipations(PersonParticipationsRef ref, String id) async {
  final slides = await ref.read(peopleRepositoryProvider).getPersonParticipations(id);

  return slides;
}

@riverpod
class PopularPeople extends _$PopularPeople {
  int page = 0;
  bool isLoading = false;

  @override
  List<GenericSlide> build() {
    return [];
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    page++;

    final people = await ref.read(peopleRepositoryProvider).getPopularPeople(page: page);
    state = [
      ...state,
      ...people,
    ];

    isLoading = false;
  }
}