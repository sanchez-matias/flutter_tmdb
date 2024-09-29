// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$intialLoadingHash() => r'e1ac571b95e550a59272707d248c29e32fa62108';

/// See also [intialLoading].
@ProviderFor(intialLoading)
final intialLoadingProvider = AutoDisposeProvider<bool>.internal(
  intialLoading,
  name: r'intialLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$intialLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IntialLoadingRef = AutoDisposeProviderRef<bool>;
String _$getMovieByIdHash() => r'55e8adb8195d0ec473c0b0ddedc840b08b38ac7d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getMovieById].
@ProviderFor(getMovieById)
const getMovieByIdProvider = GetMovieByIdFamily();

/// See also [getMovieById].
class GetMovieByIdFamily extends Family<AsyncValue<Movie>> {
  /// See also [getMovieById].
  const GetMovieByIdFamily();

  /// See also [getMovieById].
  GetMovieByIdProvider call(
    String id,
  ) {
    return GetMovieByIdProvider(
      id,
    );
  }

  @override
  GetMovieByIdProvider getProviderOverride(
    covariant GetMovieByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMovieByIdProvider';
}

/// See also [getMovieById].
class GetMovieByIdProvider extends FutureProvider<Movie> {
  /// See also [getMovieById].
  GetMovieByIdProvider(
    String id,
  ) : this._internal(
          (ref) => getMovieById(
            ref as GetMovieByIdRef,
            id,
          ),
          from: getMovieByIdProvider,
          name: r'getMovieByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMovieByIdHash,
          dependencies: GetMovieByIdFamily._dependencies,
          allTransitiveDependencies:
              GetMovieByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetMovieByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Movie> Function(GetMovieByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMovieByIdProvider._internal(
        (ref) => create(ref as GetMovieByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Movie> createElement() {
    return _GetMovieByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMovieByIdRef on FutureProviderRef<Movie> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetMovieByIdProviderElement extends FutureProviderElement<Movie>
    with GetMovieByIdRef {
  _GetMovieByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetMovieByIdProvider).id;
}

String _$similarMoviesHash() => r'f34c408c554f812ddefc159d42048f9c420288a4';

/// See also [similarMovies].
@ProviderFor(similarMovies)
const similarMoviesProvider = SimilarMoviesFamily();

/// See also [similarMovies].
class SimilarMoviesFamily extends Family<AsyncValue<List<GenericSlide>>> {
  /// See also [similarMovies].
  const SimilarMoviesFamily();

  /// See also [similarMovies].
  SimilarMoviesProvider call(
    String id,
  ) {
    return SimilarMoviesProvider(
      id,
    );
  }

  @override
  SimilarMoviesProvider getProviderOverride(
    covariant SimilarMoviesProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'similarMoviesProvider';
}

/// See also [similarMovies].
class SimilarMoviesProvider
    extends AutoDisposeFutureProvider<List<GenericSlide>> {
  /// See also [similarMovies].
  SimilarMoviesProvider(
    String id,
  ) : this._internal(
          (ref) => similarMovies(
            ref as SimilarMoviesRef,
            id,
          ),
          from: similarMoviesProvider,
          name: r'similarMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$similarMoviesHash,
          dependencies: SimilarMoviesFamily._dependencies,
          allTransitiveDependencies:
              SimilarMoviesFamily._allTransitiveDependencies,
          id: id,
        );

  SimilarMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<GenericSlide>> Function(SimilarMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SimilarMoviesProvider._internal(
        (ref) => create(ref as SimilarMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GenericSlide>> createElement() {
    return _SimilarMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarMoviesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SimilarMoviesRef on AutoDisposeFutureProviderRef<List<GenericSlide>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SimilarMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<GenericSlide>>
    with SimilarMoviesRef {
  _SimilarMoviesProviderElement(super.provider);

  @override
  String get id => (origin as SimilarMoviesProvider).id;
}

String _$nowPlayingMoviesHash() => r'8306913875cd3aa7e17bb48d244756f042163978';

/// See also [NowPlayingMovies].
@ProviderFor(NowPlayingMovies)
final nowPlayingMoviesProvider =
    AutoDisposeNotifierProvider<NowPlayingMovies, List<GenericSlide>>.internal(
  NowPlayingMovies.new,
  name: r'nowPlayingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NowPlayingMovies = AutoDisposeNotifier<List<GenericSlide>>;
String _$topRatedMoviesHash() => r'1c7e991ee20c4604a50a0047d179685d97df1508';

/// See also [TopRatedMovies].
@ProviderFor(TopRatedMovies)
final topRatedMoviesProvider =
    AutoDisposeNotifierProvider<TopRatedMovies, List<GenericSlide>>.internal(
  TopRatedMovies.new,
  name: r'topRatedMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topRatedMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TopRatedMovies = AutoDisposeNotifier<List<GenericSlide>>;
String _$upcomingMoviesHash() => r'cae1e82d0acf3126f0c41d619c59738f08397d11';

/// See also [UpcomingMovies].
@ProviderFor(UpcomingMovies)
final upcomingMoviesProvider =
    AutoDisposeNotifierProvider<UpcomingMovies, List<GenericSlide>>.internal(
  UpcomingMovies.new,
  name: r'upcomingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpcomingMovies = AutoDisposeNotifier<List<GenericSlide>>;
String _$todaysTrendingHash() => r'054a7181d486c38da13c1d6eea1625fee1452951';

/// See also [TodaysTrending].
@ProviderFor(TodaysTrending)
final todaysTrendingProvider =
    AutoDisposeNotifierProvider<TodaysTrending, List<GenericSlide>>.internal(
  TodaysTrending.new,
  name: r'todaysTrendingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todaysTrendingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodaysTrending = AutoDisposeNotifier<List<GenericSlide>>;
String _$ratedMoviesHash() => r'ed650a5e6f9fa225c572db03cf7ed38a9a62c573';

/// See also [RatedMovies].
@ProviderFor(RatedMovies)
final ratedMoviesProvider =
    AutoDisposeNotifierProvider<RatedMovies, List<GenericSlide>>.internal(
  RatedMovies.new,
  name: r'ratedMoviesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ratedMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RatedMovies = AutoDisposeNotifier<List<GenericSlide>>;
String _$favoriteMoviesHash() => r'2e190da74a1a375ec8f8ee6c4104d2eeb9cd759a';

/// See also [FavoriteMovies].
@ProviderFor(FavoriteMovies)
final favoriteMoviesProvider =
    AutoDisposeNotifierProvider<FavoriteMovies, List<GenericSlide>>.internal(
  FavoriteMovies.new,
  name: r'favoriteMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteMovies = AutoDisposeNotifier<List<GenericSlide>>;
String _$moviesWatchlistHash() => r'7b422fdc048b069e0caf8964221ee4608ad1bd5a';

/// See also [MoviesWatchlist].
@ProviderFor(MoviesWatchlist)
final moviesWatchlistProvider =
    AutoDisposeNotifierProvider<MoviesWatchlist, List<GenericSlide>>.internal(
  MoviesWatchlist.new,
  name: r'moviesWatchlistProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moviesWatchlistHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MoviesWatchlist = AutoDisposeNotifier<List<GenericSlide>>;
String _$movieAccountStateHash() => r'4df23046ff10adc17a3fa10057b56e28af7accce';

abstract class _$MovieAccountState
    extends BuildlessAutoDisposeAsyncNotifier<TitleAccountState> {
  late final String movieId;

  FutureOr<TitleAccountState> build(
    String movieId,
  );
}

/// See also [MovieAccountState].
@ProviderFor(MovieAccountState)
const movieAccountStateProvider = MovieAccountStateFamily();

/// See also [MovieAccountState].
class MovieAccountStateFamily extends Family<AsyncValue<TitleAccountState>> {
  /// See also [MovieAccountState].
  const MovieAccountStateFamily();

  /// See also [MovieAccountState].
  MovieAccountStateProvider call(
    String movieId,
  ) {
    return MovieAccountStateProvider(
      movieId,
    );
  }

  @override
  MovieAccountStateProvider getProviderOverride(
    covariant MovieAccountStateProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieAccountStateProvider';
}

/// See also [MovieAccountState].
class MovieAccountStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MovieAccountState, TitleAccountState> {
  /// See also [MovieAccountState].
  MovieAccountStateProvider(
    String movieId,
  ) : this._internal(
          () => MovieAccountState()..movieId = movieId,
          from: movieAccountStateProvider,
          name: r'movieAccountStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieAccountStateHash,
          dependencies: MovieAccountStateFamily._dependencies,
          allTransitiveDependencies:
              MovieAccountStateFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieAccountStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final String movieId;

  @override
  FutureOr<TitleAccountState> runNotifierBuild(
    covariant MovieAccountState notifier,
  ) {
    return notifier.build(
      movieId,
    );
  }

  @override
  Override overrideWith(MovieAccountState Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieAccountStateProvider._internal(
        () => create()..movieId = movieId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MovieAccountState, TitleAccountState>
      createElement() {
    return _MovieAccountStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieAccountStateProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieAccountStateRef
    on AutoDisposeAsyncNotifierProviderRef<TitleAccountState> {
  /// The parameter `movieId` of this provider.
  String get movieId;
}

class _MovieAccountStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MovieAccountState,
        TitleAccountState> with MovieAccountStateRef {
  _MovieAccountStateProviderElement(super.provider);

  @override
  String get movieId => (origin as MovieAccountStateProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
