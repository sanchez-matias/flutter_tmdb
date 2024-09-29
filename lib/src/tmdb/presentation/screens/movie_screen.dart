import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tmdb/core/helpers/human_formats.dart';
import 'package:flutter_tmdb/src/tmdb/domain/entities/movie.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/providers/providers.dart';
import 'package:flutter_tmdb/src/tmdb/presentation/widgets/widgets.dart';

class MovieScreen extends ConsumerWidget {
  final String id;

  const MovieScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovie = ref.watch(getMovieByIdProvider(id));

    return asyncMovie.when(
      data: (movie) => Scaffold(
          body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MovieDetails(movie),
                childCount: 1),
          )
        ],
      )),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(error.toString()),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class _CustomAppBar extends ConsumerWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final movieAccountState = ref.watch(movieAccountStateProvider(movie.id));

    return SliverAppBar(
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      expandedHeight: size.width / 2,
      actions: movieAccountState.when(
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
              await ref.read(movieAccountStateProvider(movie.id).notifier)
                .toggleMovieFavorite();
            },
            icon: data.isFavorite
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(movieAccountStateProvider(movie.id).notifier)
                .toggleMovieWatchlist();
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
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
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

class _MovieDetails extends ConsumerWidget {
  final Movie movie;

  const _MovieDetails(this.movie);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casting = ref.watch(movieCastingProvider(movie.id.toString()));
    final reviews = ref.watch(movieReviewsSlideProvider(movie.id));
    final similar = ref.watch(similarMoviesProvider(movie.id.toString()));

    final extraDetailsItems = [
      ExtraInfo(title: 'Runtime', info: '${movie.runtime} minutes'),
      ExtraInfo(title: 'Release Date', info: HumanFormats.longDate(movie.releaseDate)),
      ExtraInfo(title: 'Tagline', info: movie.tagline),
      ExtraInfo(title: 'Budget', info: HumanFormats.number(movie.budget.toDouble())),
      ExtraInfo(title: 'Revenue',info: HumanFormats.number(movie.revenue.toDouble())),
      ExtraInfo(title: 'Status', info: movie.status),
      ExtraInfo(title: 'Popularity Points',info: HumanFormats.number(movie.popularity)),
      ExtraInfo(title: 'Homepage', info: movie.homepage),
      ExtraInfo(title: 'Original Lang.', info: movie.originalLanguage),
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BodyHeader(movie),
          InfoCard(
            title: 'Movie Info',
            contentText: movie.overview,
            overviewMaxLines: 5,
            extraDetailsItems: extraDetailsItems,
          ),
          HorizontalLisViewCard(slides: casting, title: 'Casting', height: 300),
          ReviewsSection(reviews: reviews, screenPath: '/home/movie/${movie.id}/reviews'),
          RecomendationsSection(slides: similar),
        ],
      ),
    );
  }
}

class _BodyHeader extends StatelessWidget {
  final Movie movie;

  const _BodyHeader(this.movie);

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
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
                  Text(movie.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: colors.primary,
                      )),
                  const SizedBox(height: 5),
                  movie.title == movie.originalTitle
                      ? const SizedBox(height: 24)
                      : Text(movie.originalTitle,
                          style: textStyles.titleMedium),
                  const Spacer(),
                  ColoredScore(score: movie.voteAverage),
                  const SizedBox(height: 10),
                  Text('Released in ${movie.releaseDate?.year.toString()}'),
                  const SizedBox(height: 10),
                  _GenresChips(movie.genres)
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
