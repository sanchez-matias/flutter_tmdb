import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/core/helpers/human_formats.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_episode.dart';

import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_season.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/tv/tv_providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';

class TvSeasonScreen extends ConsumerWidget {
  final TvSeason season;
  final String seriesId;

  const TvSeasonScreen({
    super.key,
    required this.season,
    required this.seriesId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEpisodes =
        ref.watch(tvEpisodesProvider(seriesId, season.seasonNumber));
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(HumanFormats.shortDate(season.airDate) ?? '')),
      body: Center(
        child: asyncEpisodes.when(
          error: (error, stackTrace) => Text('Error: ${error.toString()}'),
          loading: () => const CircularProgressIndicator.adaptive(),
          data: (data) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Season info
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomFadeImage(
                          imagePath: season.posterPath, height: 200),
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(season.name, style: textStyles.titleLarge),
                          const SizedBox(height: 15),
                          Text(season.overview.isEmpty
                              ? 'No overview'
                              : season.overview)
                        ],
                      ),
                    )
                  ],
                ),

                // Episodes info
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Episodes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ...List.generate(
                  data.length,
                  (index) => _EpisodeCard(data[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EpisodeCard extends StatelessWidget {
  final TvEpisode episode;

  const _EpisodeCard(this.episode);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card.outlined(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StillImage(
                  stillPath: episode.stillPath,
                  voteAverage: episode.voteAverage,
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${episode.episodeNumber} - ${episode.name}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(episode.overview.isEmpty
                          ? 'No description'
                          : episode.overview),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            title: const Text('See More'),
            children: [
              episode.runtime == null
                  ? const Text('Runtime: NOT PROVIDED')
                  : Text('Runtime: ${episode.runtime} minutes'),
              Text('Vote Count: ${episode.voteCount}'),
              Text('Released in ${HumanFormats.longDate(episode.airDate)}'),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: colors.primary,
                  shape: const StadiumBorder(),
                  child: Text('Rate episode ${episode.episodeNumber}'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _StillImage extends StatelessWidget {
  final String stillPath;
  final double voteAverage;

  const _StillImage({
    required this.stillPath,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: size.width * 0.35,
        child: Stack(
          children: [
            FadeInImage(
                height: 100,
                fit: BoxFit.fitHeight,
                placeholderFit: BoxFit.fitHeight,
                placeholder: const AssetImage('assets/loaders/loading.gif'),
                image:
                    NetworkImage('https://image.tmdb.org/t/p/w500$stillPath'),
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/loaders/no_image.png',
                      height: 100,
                      fit: BoxFit.fitWidth,
                    )),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: size.width * 0.35,
                height: 100,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.5],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: ColoredScore(score: voteAverage),
            ),
          ],
        ),
      ),
    );
  }
}
