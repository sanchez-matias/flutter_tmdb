import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/core/helpers/human_formats.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_season.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/tv_series.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/screens/screens.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';
import 'package:card_swiper/card_swiper.dart';

class TvScreen extends ConsumerWidget {
  final String id;

  const TvScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSeries = ref.watch(tvSeriesProvider(id));

    return asyncSeries.when(
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('There was an error loading this series.'),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      data: (series) => Scaffold(
          body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _SeriesAppbar(series),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _ScreenDetails(series),
                childCount: 1),
          )
        ],
      )),
    );
  }
}

class _SeriesAppbar extends ConsumerWidget {
  final TvSeries series;

  const _SeriesAppbar(this.series);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final tvAccountState = ref.watch(tvAccountStateProvider(series.id));

    return SliverAppBar(
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      expandedHeight: size.width / 2,
      actions: tvAccountState.when(
        error: (error, stackTrace) => [const Icon(Icons.error_outline)],
        loading: () => [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_outline),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.bookmark_outline),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.list_rounded),
          ),
        ],
        data: (data) => [
          IconButton(
            onPressed: () async {
              await ref.read(tvAccountStateProvider(series.id).notifier)
                .toggleTvFavorite();
            },
            icon: data.isFavorite
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(tvAccountStateProvider(series.id).notifier)
                .toggleTvWatchlist();
            },
            icon: data.isInWatchlist
              ? const Icon(Icons.bookmark)
              : const Icon(Icons.bookmark_outline),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Backdrop image
            SizedBox.expand(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${series.backdropPath}',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return child;
                },
              ),
            ),

            // Gradient
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.45],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenDetails extends ConsumerWidget {
  final TvSeries series;

  const _ScreenDetails(this.series);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actors = ref.watch(tvCastingProvider(series.id));
    final reviews = ref.watch(tvReviewsSlideProvider(series.id));
    final similar = ref.watch(similarSeriesProvider(series.id));

    final extraDetailsItems = [
      ExtraInfo(title: 'Creators', info: series.createdBy.join(' - ')),
      ExtraInfo(title: 'Episodes', info: series.numberOfEpisodes.toString()),
      ExtraInfo(title: 'Release Date',info: HumanFormats.longDate(series.firsAirDate)),
      ExtraInfo(title: 'Is in Production', info: series.inProduction ? 'Yes' : 'No'),
      ExtraInfo(title: 'Original Name', info: series.originalName),
      ExtraInfo(title: 'Origin Country', info: series.originCountry),
      ExtraInfo(title: 'Original Language', info: series.originalLanguage),
      ExtraInfo(title: 'Popularity', info: HumanFormats.number(series.popularity)),
      ExtraInfo(title: 'Production Companies', info: series.productionCompanies.join(', ')),
      ExtraInfo(title: 'Status', info: series.status),
      ExtraInfo(title: 'Tagline', info: series.tagline),
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _BodyHeader(series),
            InfoCard(
                title: 'Series Info',
                contentText: series.overview,
                overviewMaxLines: 5,
                extraDetailsItems: extraDetailsItems,
            ),
            _SeasonSwiper(
              seasons: series.seasons
                  .where((season) => season.numberOfEpisodes > 0)
                  .toList(),
              seriesId: series.id,
            ),
            const SizedBox(height: 40),
            HorizontalLisViewCard(slides: actors, title: 'Actors', height: 300),
            ReviewsSection(
                reviews: reviews, screenPath: '/home/tv/${series.id}/reviews'),
            RecomendationsSection(slides: similar),
          ],
        ),
      ),
    );
  }
}

class _BodyHeader extends StatelessWidget {
  final TvSeries series;

  const _BodyHeader(this.series);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: size.height * 0.26,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${series.posterPath}',
                width: size.width * 0.3,
              ),
            ),

            const SizedBox(width: 15),

            // Main data
            SizedBox(
              width: (size.width - 60) * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(series.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: colors.primary,
                      )),
                  const SizedBox(height: 5),
                  series.name == series.originalName
                      ? const SizedBox(height: 24)
                      : Text(series.originalName,
                          style: textStyles.titleMedium),
                  const Spacer(),
                  ColoredScore(score: series.voteAverage),
                  const SizedBox(height: 10),
                  Text('Released in ${series.firsAirDate?.year}'),
                  const SizedBox(height: 10),
                  _GenresChips(series.genres)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenresChips extends StatelessWidget {
  final List<String> genres;

  const _GenresChips(this.genres);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          genres.length,
          (index) => Padding(
            padding: const EdgeInsets.all(2),
            child: Chip(
              label: Text(genres[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class _SeasonSwiper extends StatelessWidget {
  final String seriesId;
  final List<TvSeason> seasons;

  const _SeasonSwiper({
    required this.seasons,
    required this.seriesId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seasons ${seasons.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: 250,
              width: double.infinity,
              child: Swiper(
                  loop: seasons.length > 1 ? true : false,
                  control: const SwiperControl(),
                  viewportFraction: 1,
                  scale: 0.8,
                  itemCount: seasons.length,
                  autoplay: false,
                  itemBuilder: (context, index) => _SeasonSlide(
                        season: seasons[index],
                        seriesId: seriesId,
                      ))),
        ],
      ),
    );
  }
}

class _SeasonSlide extends StatelessWidget {
  final TvSeason season;
  final String seriesId;

  const _SeasonSlide({
    required this.season,
    required this.seriesId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Card.outlined(
        elevation: 15,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TvSeasonScreen(
                    season: season,
                    seriesId: seriesId,
                  ),
                ));
          },
          child: SizedBox(
            height: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomFadeImage(
                  imagePath: season.posterPath,
                  height: 240,
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          season.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('${season.numberOfEpisodes} Episodes'),
                        const SizedBox(height: 10),
                        Text(
                          season.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
