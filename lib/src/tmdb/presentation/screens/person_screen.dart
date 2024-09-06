import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/person.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';

class PersonScreen extends ConsumerWidget {
  final String id;

  const PersonScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPerson = ref.watch(personByIdProvider(id));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Person ID: $id'),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => selectedPerson.when(
                  error: (error, stackTrace) => Center(
                    child: Text(
                        'Sorry! There was an error getting the person. ${error.toString()}'),
                  ),
                  loading: () => const Column(
                    children: [
                      SizedBox(height: 100),
                      CircularProgressIndicator(),
                    ],
                  ),
                  data: (person) => _PersonDetails(person),
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonDetails extends ConsumerWidget {
  final Person person;

  const _PersonDetails(this.person);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personParticipations = ref.watch(personParticipationsProvider(person.id));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _CustomProfileAndName(
              profilePath: person.profilePath,
              name: person.name,
            ),
            TextButton.icon(
              onPressed: null,
              label: Text('${person.popularity}'),
              icon: const Icon(Icons.star_rounded),
            ),
            InfoCard(
              title: 'Person Details',
              contentText: person.biography,
              overviewMaxLines: 12,
              extraDetailsItems: [
                ExtraInfo(title: 'Nickname', info: person.alsoKnownAs.isEmpty
                  ? 'No nickname'
                  : person.alsoKnownAs.first),
                ExtraInfo(title: 'Gender', info: switch (person.gender) {
                  1 => 'Female',
                  2 => 'Male',
                  3 => 'Non binary',
                  int() => 'Not Specified',
                }),
                ExtraInfo(title: 'Job', info: person.knownForDeparment),
                ExtraInfo(title: 'Birthday', info: person.birthday?.toString().substring(0, 10)),
                ExtraInfo(title: 'Deathday', info: person.deathday?.toString().substring(0, 10)),
                ExtraInfo(title: 'Place of Birth', info: person.placeOfBirth),
              ],
            ),
            HorizontalLisViewCard(
              slides: personParticipations,
              title: 'Participations',
              height: 320,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomProfileAndName extends StatelessWidget {
  final String profilePath;
  final String name;

  const _CustomProfileAndName({required this.profilePath, required this.name});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        CustomFadeImage(imagePath: profilePath, height: 220),
        const SizedBox(height: 20),
        Text(name, style: textStyle.headlineSmall),
      ],
    );
  }
}
