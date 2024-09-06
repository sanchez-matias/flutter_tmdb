// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieReviewsHash() => r'a3a3d7a7a2894a3db766d919da1ed71b4c6f76f9';

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

/// See also [movieReviews].
@ProviderFor(movieReviews)
const movieReviewsProvider = MovieReviewsFamily();

/// See also [movieReviews].
class MovieReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [movieReviews].
  const MovieReviewsFamily();

  /// See also [movieReviews].
  MovieReviewsProvider call(
    String id,
    int page,
  ) {
    return MovieReviewsProvider(
      id,
      page,
    );
  }

  @override
  MovieReviewsProvider getProviderOverride(
    covariant MovieReviewsProvider provider,
  ) {
    return call(
      provider.id,
      provider.page,
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
  String? get name => r'movieReviewsProvider';
}

/// See also [movieReviews].
class MovieReviewsProvider extends AutoDisposeFutureProvider<List<Review>> {
  /// See also [movieReviews].
  MovieReviewsProvider(
    String id,
    int page,
  ) : this._internal(
          (ref) => movieReviews(
            ref as MovieReviewsRef,
            id,
            page,
          ),
          from: movieReviewsProvider,
          name: r'movieReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieReviewsHash,
          dependencies: MovieReviewsFamily._dependencies,
          allTransitiveDependencies:
              MovieReviewsFamily._allTransitiveDependencies,
          id: id,
          page: page,
        );

  MovieReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.page,
  }) : super.internal();

  final String id;
  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Review>> Function(MovieReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieReviewsProvider._internal(
        (ref) => create(ref as MovieReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Review>> createElement() {
    return _MovieReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieReviewsProvider &&
        other.id == id &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieReviewsRef on AutoDisposeFutureProviderRef<List<Review>> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `page` of this provider.
  int get page;
}

class _MovieReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<Review>>
    with MovieReviewsRef {
  _MovieReviewsProviderElement(super.provider);

  @override
  String get id => (origin as MovieReviewsProvider).id;
  @override
  int get page => (origin as MovieReviewsProvider).page;
}

String _$tvReviewsHash() => r'a4d882922af18bd74c573d4463f886cd51f963bd';

/// See also [tvReviews].
@ProviderFor(tvReviews)
const tvReviewsProvider = TvReviewsFamily();

/// See also [tvReviews].
class TvReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [tvReviews].
  const TvReviewsFamily();

  /// See also [tvReviews].
  TvReviewsProvider call(
    String id,
  ) {
    return TvReviewsProvider(
      id,
    );
  }

  @override
  TvReviewsProvider getProviderOverride(
    covariant TvReviewsProvider provider,
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
  String? get name => r'tvReviewsProvider';
}

/// See also [tvReviews].
class TvReviewsProvider extends AutoDisposeFutureProvider<List<Review>> {
  /// See also [tvReviews].
  TvReviewsProvider(
    String id,
  ) : this._internal(
          (ref) => tvReviews(
            ref as TvReviewsRef,
            id,
          ),
          from: tvReviewsProvider,
          name: r'tvReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvReviewsHash,
          dependencies: TvReviewsFamily._dependencies,
          allTransitiveDependencies: TvReviewsFamily._allTransitiveDependencies,
          id: id,
        );

  TvReviewsProvider._internal(
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
    FutureOr<List<Review>> Function(TvReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvReviewsProvider._internal(
        (ref) => create(ref as TvReviewsRef),
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
  AutoDisposeFutureProviderElement<List<Review>> createElement() {
    return _TvReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvReviewsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvReviewsRef on AutoDisposeFutureProviderRef<List<Review>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TvReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<Review>> with TvReviewsRef {
  _TvReviewsProviderElement(super.provider);

  @override
  String get id => (origin as TvReviewsProvider).id;
}

String _$movieReviewsSlideHash() => r'519c4a74285560dd50abe0f5e69fea74b8cc3bb7';

/// See also [movieReviewsSlide].
@ProviderFor(movieReviewsSlide)
const movieReviewsSlideProvider = MovieReviewsSlideFamily();

/// See also [movieReviewsSlide].
class MovieReviewsSlideFamily extends Family<AsyncValue<Review?>> {
  /// See also [movieReviewsSlide].
  const MovieReviewsSlideFamily();

  /// See also [movieReviewsSlide].
  MovieReviewsSlideProvider call(
    String id,
  ) {
    return MovieReviewsSlideProvider(
      id,
    );
  }

  @override
  MovieReviewsSlideProvider getProviderOverride(
    covariant MovieReviewsSlideProvider provider,
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
  String? get name => r'movieReviewsSlideProvider';
}

/// See also [movieReviewsSlide].
class MovieReviewsSlideProvider extends AutoDisposeStreamProvider<Review?> {
  /// See also [movieReviewsSlide].
  MovieReviewsSlideProvider(
    String id,
  ) : this._internal(
          (ref) => movieReviewsSlide(
            ref as MovieReviewsSlideRef,
            id,
          ),
          from: movieReviewsSlideProvider,
          name: r'movieReviewsSlideProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieReviewsSlideHash,
          dependencies: MovieReviewsSlideFamily._dependencies,
          allTransitiveDependencies:
              MovieReviewsSlideFamily._allTransitiveDependencies,
          id: id,
        );

  MovieReviewsSlideProvider._internal(
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
    Stream<Review?> Function(MovieReviewsSlideRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieReviewsSlideProvider._internal(
        (ref) => create(ref as MovieReviewsSlideRef),
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
  AutoDisposeStreamProviderElement<Review?> createElement() {
    return _MovieReviewsSlideProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieReviewsSlideProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieReviewsSlideRef on AutoDisposeStreamProviderRef<Review?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MovieReviewsSlideProviderElement
    extends AutoDisposeStreamProviderElement<Review?>
    with MovieReviewsSlideRef {
  _MovieReviewsSlideProviderElement(super.provider);

  @override
  String get id => (origin as MovieReviewsSlideProvider).id;
}

String _$tvReviewsSlideHash() => r'b78224f494aba9f7a356277ea886f61bb7c51ca7';

/// See also [tvReviewsSlide].
@ProviderFor(tvReviewsSlide)
const tvReviewsSlideProvider = TvReviewsSlideFamily();

/// See also [tvReviewsSlide].
class TvReviewsSlideFamily extends Family<AsyncValue<Review?>> {
  /// See also [tvReviewsSlide].
  const TvReviewsSlideFamily();

  /// See also [tvReviewsSlide].
  TvReviewsSlideProvider call(
    String id,
  ) {
    return TvReviewsSlideProvider(
      id,
    );
  }

  @override
  TvReviewsSlideProvider getProviderOverride(
    covariant TvReviewsSlideProvider provider,
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
  String? get name => r'tvReviewsSlideProvider';
}

/// See also [tvReviewsSlide].
class TvReviewsSlideProvider extends AutoDisposeStreamProvider<Review?> {
  /// See also [tvReviewsSlide].
  TvReviewsSlideProvider(
    String id,
  ) : this._internal(
          (ref) => tvReviewsSlide(
            ref as TvReviewsSlideRef,
            id,
          ),
          from: tvReviewsSlideProvider,
          name: r'tvReviewsSlideProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvReviewsSlideHash,
          dependencies: TvReviewsSlideFamily._dependencies,
          allTransitiveDependencies:
              TvReviewsSlideFamily._allTransitiveDependencies,
          id: id,
        );

  TvReviewsSlideProvider._internal(
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
    Stream<Review?> Function(TvReviewsSlideRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvReviewsSlideProvider._internal(
        (ref) => create(ref as TvReviewsSlideRef),
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
  AutoDisposeStreamProviderElement<Review?> createElement() {
    return _TvReviewsSlideProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvReviewsSlideProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvReviewsSlideRef on AutoDisposeStreamProviderRef<Review?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TvReviewsSlideProviderElement
    extends AutoDisposeStreamProviderElement<Review?> with TvReviewsSlideRef {
  _TvReviewsSlideProviderElement(super.provider);

  @override
  String get id => (origin as TvReviewsSlideProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
