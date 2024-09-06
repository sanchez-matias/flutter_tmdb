// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tvInitialLoadingHash() => r'87cc6848213c11d35d5e79a10c01ed47427b22f9';

/// See also [tvInitialLoading].
@ProviderFor(tvInitialLoading)
final tvInitialLoadingProvider = AutoDisposeProvider<bool>.internal(
  tvInitialLoading,
  name: r'tvInitialLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tvInitialLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TvInitialLoadingRef = AutoDisposeProviderRef<bool>;
String _$tvSeriesHash() => r'73526566c61c1b449528b07ea8aee3abc4573460';

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

/// See also [tvSeries].
@ProviderFor(tvSeries)
const tvSeriesProvider = TvSeriesFamily();

/// See also [tvSeries].
class TvSeriesFamily extends Family<AsyncValue<TvSeries>> {
  /// See also [tvSeries].
  const TvSeriesFamily();

  /// See also [tvSeries].
  TvSeriesProvider call(
    String id,
  ) {
    return TvSeriesProvider(
      id,
    );
  }

  @override
  TvSeriesProvider getProviderOverride(
    covariant TvSeriesProvider provider,
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
  String? get name => r'tvSeriesProvider';
}

/// See also [tvSeries].
class TvSeriesProvider extends FutureProvider<TvSeries> {
  /// See also [tvSeries].
  TvSeriesProvider(
    String id,
  ) : this._internal(
          (ref) => tvSeries(
            ref as TvSeriesRef,
            id,
          ),
          from: tvSeriesProvider,
          name: r'tvSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvSeriesHash,
          dependencies: TvSeriesFamily._dependencies,
          allTransitiveDependencies: TvSeriesFamily._allTransitiveDependencies,
          id: id,
        );

  TvSeriesProvider._internal(
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
    FutureOr<TvSeries> Function(TvSeriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvSeriesProvider._internal(
        (ref) => create(ref as TvSeriesRef),
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
  FutureProviderElement<TvSeries> createElement() {
    return _TvSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvSeriesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvSeriesRef on FutureProviderRef<TvSeries> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TvSeriesProviderElement extends FutureProviderElement<TvSeries>
    with TvSeriesRef {
  _TvSeriesProviderElement(super.provider);

  @override
  String get id => (origin as TvSeriesProvider).id;
}

String _$similarSeriesHash() => r'2091030c247181aaa9f696ed9f86b154b515cafd';

/// See also [similarSeries].
@ProviderFor(similarSeries)
const similarSeriesProvider = SimilarSeriesFamily();

/// See also [similarSeries].
class SimilarSeriesFamily extends Family<AsyncValue<List<GenericSlide>>> {
  /// See also [similarSeries].
  const SimilarSeriesFamily();

  /// See also [similarSeries].
  SimilarSeriesProvider call(
    String id,
  ) {
    return SimilarSeriesProvider(
      id,
    );
  }

  @override
  SimilarSeriesProvider getProviderOverride(
    covariant SimilarSeriesProvider provider,
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
  String? get name => r'similarSeriesProvider';
}

/// See also [similarSeries].
class SimilarSeriesProvider
    extends AutoDisposeFutureProvider<List<GenericSlide>> {
  /// See also [similarSeries].
  SimilarSeriesProvider(
    String id,
  ) : this._internal(
          (ref) => similarSeries(
            ref as SimilarSeriesRef,
            id,
          ),
          from: similarSeriesProvider,
          name: r'similarSeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$similarSeriesHash,
          dependencies: SimilarSeriesFamily._dependencies,
          allTransitiveDependencies:
              SimilarSeriesFamily._allTransitiveDependencies,
          id: id,
        );

  SimilarSeriesProvider._internal(
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
    FutureOr<List<GenericSlide>> Function(SimilarSeriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SimilarSeriesProvider._internal(
        (ref) => create(ref as SimilarSeriesRef),
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
    return _SimilarSeriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarSeriesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SimilarSeriesRef on AutoDisposeFutureProviderRef<List<GenericSlide>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SimilarSeriesProviderElement
    extends AutoDisposeFutureProviderElement<List<GenericSlide>>
    with SimilarSeriesRef {
  _SimilarSeriesProviderElement(super.provider);

  @override
  String get id => (origin as SimilarSeriesProvider).id;
}

String _$tvEpisodesHash() => r'a20eb9ca4168d6cf6919f27ec9f0ded1c70faf2d';

/// See also [tvEpisodes].
@ProviderFor(tvEpisodes)
const tvEpisodesProvider = TvEpisodesFamily();

/// See also [tvEpisodes].
class TvEpisodesFamily extends Family<AsyncValue<List<TvEpisode>>> {
  /// See also [tvEpisodes].
  const TvEpisodesFamily();

  /// See also [tvEpisodes].
  TvEpisodesProvider call(
    String id,
    int season,
  ) {
    return TvEpisodesProvider(
      id,
      season,
    );
  }

  @override
  TvEpisodesProvider getProviderOverride(
    covariant TvEpisodesProvider provider,
  ) {
    return call(
      provider.id,
      provider.season,
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
  String? get name => r'tvEpisodesProvider';
}

/// See also [tvEpisodes].
class TvEpisodesProvider extends AutoDisposeFutureProvider<List<TvEpisode>> {
  /// See also [tvEpisodes].
  TvEpisodesProvider(
    String id,
    int season,
  ) : this._internal(
          (ref) => tvEpisodes(
            ref as TvEpisodesRef,
            id,
            season,
          ),
          from: tvEpisodesProvider,
          name: r'tvEpisodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvEpisodesHash,
          dependencies: TvEpisodesFamily._dependencies,
          allTransitiveDependencies:
              TvEpisodesFamily._allTransitiveDependencies,
          id: id,
          season: season,
        );

  TvEpisodesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.season,
  }) : super.internal();

  final String id;
  final int season;

  @override
  Override overrideWith(
    FutureOr<List<TvEpisode>> Function(TvEpisodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvEpisodesProvider._internal(
        (ref) => create(ref as TvEpisodesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        season: season,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TvEpisode>> createElement() {
    return _TvEpisodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvEpisodesProvider &&
        other.id == id &&
        other.season == season;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvEpisodesRef on AutoDisposeFutureProviderRef<List<TvEpisode>> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `season` of this provider.
  int get season;
}

class _TvEpisodesProviderElement
    extends AutoDisposeFutureProviderElement<List<TvEpisode>>
    with TvEpisodesRef {
  _TvEpisodesProviderElement(super.provider);

  @override
  String get id => (origin as TvEpisodesProvider).id;
  @override
  int get season => (origin as TvEpisodesProvider).season;
}

String _$airingTodayHash() => r'ae2e1645c297a7b9ccbcf98ac01bcc6df94dc21c';

/// See also [AiringToday].
@ProviderFor(AiringToday)
final airingTodayProvider =
    AutoDisposeNotifierProvider<AiringToday, List<GenericSlide>>.internal(
  AiringToday.new,
  name: r'airingTodayProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$airingTodayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiringToday = AutoDisposeNotifier<List<GenericSlide>>;
String _$onTheAirHash() => r'bddfed7499fd7d6c14038db98e10844b9ddf6701';

/// See also [OnTheAir].
@ProviderFor(OnTheAir)
final onTheAirProvider =
    AutoDisposeNotifierProvider<OnTheAir, List<GenericSlide>>.internal(
  OnTheAir.new,
  name: r'onTheAirProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$onTheAirHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OnTheAir = AutoDisposeNotifier<List<GenericSlide>>;
String _$todaysTrendingTvHash() => r'288430c61a6d1ce5b7636362ca1a9d434e1502f0';

/// See also [TodaysTrendingTv].
@ProviderFor(TodaysTrendingTv)
final todaysTrendingTvProvider =
    AutoDisposeNotifierProvider<TodaysTrendingTv, List<GenericSlide>>.internal(
  TodaysTrendingTv.new,
  name: r'todaysTrendingTvProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todaysTrendingTvHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodaysTrendingTv = AutoDisposeNotifier<List<GenericSlide>>;
String _$topRatedTvHash() => r'cd070d311ad0439c3724c6ffa38e37b780399ac6';

/// See also [TopRatedTv].
@ProviderFor(TopRatedTv)
final topRatedTvProvider =
    AutoDisposeNotifierProvider<TopRatedTv, List<GenericSlide>>.internal(
  TopRatedTv.new,
  name: r'topRatedTvProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$topRatedTvHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TopRatedTv = AutoDisposeNotifier<List<GenericSlide>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
