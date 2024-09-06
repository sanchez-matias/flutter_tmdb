// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieCastingHash() => r'497b2c8a63de67c8475b8c958da8d8556c63d79e';

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

/// See also [movieCasting].
@ProviderFor(movieCasting)
const movieCastingProvider = MovieCastingFamily();

/// See also [movieCasting].
class MovieCastingFamily extends Family<AsyncValue<List<GenericSlide>>> {
  /// See also [movieCasting].
  const MovieCastingFamily();

  /// See also [movieCasting].
  MovieCastingProvider call(
    String id,
  ) {
    return MovieCastingProvider(
      id,
    );
  }

  @override
  MovieCastingProvider getProviderOverride(
    covariant MovieCastingProvider provider,
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
  String? get name => r'movieCastingProvider';
}

/// See also [movieCasting].
class MovieCastingProvider extends FutureProvider<List<GenericSlide>> {
  /// See also [movieCasting].
  MovieCastingProvider(
    String id,
  ) : this._internal(
          (ref) => movieCasting(
            ref as MovieCastingRef,
            id,
          ),
          from: movieCastingProvider,
          name: r'movieCastingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieCastingHash,
          dependencies: MovieCastingFamily._dependencies,
          allTransitiveDependencies:
              MovieCastingFamily._allTransitiveDependencies,
          id: id,
        );

  MovieCastingProvider._internal(
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
    FutureOr<List<GenericSlide>> Function(MovieCastingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieCastingProvider._internal(
        (ref) => create(ref as MovieCastingRef),
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
  FutureProviderElement<List<GenericSlide>> createElement() {
    return _MovieCastingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCastingProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieCastingRef on FutureProviderRef<List<GenericSlide>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MovieCastingProviderElement
    extends FutureProviderElement<List<GenericSlide>> with MovieCastingRef {
  _MovieCastingProviderElement(super.provider);

  @override
  String get id => (origin as MovieCastingProvider).id;
}

String _$tvCastingHash() => r'1d4f12972811a4a2c04133547c1cc3074a86a67a';

/// See also [tvCasting].
@ProviderFor(tvCasting)
const tvCastingProvider = TvCastingFamily();

/// See also [tvCasting].
class TvCastingFamily extends Family<AsyncValue<List<GenericSlide>>> {
  /// See also [tvCasting].
  const TvCastingFamily();

  /// See also [tvCasting].
  TvCastingProvider call(
    String id,
  ) {
    return TvCastingProvider(
      id,
    );
  }

  @override
  TvCastingProvider getProviderOverride(
    covariant TvCastingProvider provider,
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
  String? get name => r'tvCastingProvider';
}

/// See also [tvCasting].
class TvCastingProvider extends FutureProvider<List<GenericSlide>> {
  /// See also [tvCasting].
  TvCastingProvider(
    String id,
  ) : this._internal(
          (ref) => tvCasting(
            ref as TvCastingRef,
            id,
          ),
          from: tvCastingProvider,
          name: r'tvCastingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvCastingHash,
          dependencies: TvCastingFamily._dependencies,
          allTransitiveDependencies: TvCastingFamily._allTransitiveDependencies,
          id: id,
        );

  TvCastingProvider._internal(
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
    FutureOr<List<GenericSlide>> Function(TvCastingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvCastingProvider._internal(
        (ref) => create(ref as TvCastingRef),
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
  FutureProviderElement<List<GenericSlide>> createElement() {
    return _TvCastingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TvCastingProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TvCastingRef on FutureProviderRef<List<GenericSlide>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TvCastingProviderElement
    extends FutureProviderElement<List<GenericSlide>> with TvCastingRef {
  _TvCastingProviderElement(super.provider);

  @override
  String get id => (origin as TvCastingProvider).id;
}

String _$personByIdHash() => r'32fdb1616adf391f95c880b17f785693068cb203';

/// See also [personById].
@ProviderFor(personById)
const personByIdProvider = PersonByIdFamily();

/// See also [personById].
class PersonByIdFamily extends Family<AsyncValue<PersonModel>> {
  /// See also [personById].
  const PersonByIdFamily();

  /// See also [personById].
  PersonByIdProvider call(
    String id,
  ) {
    return PersonByIdProvider(
      id,
    );
  }

  @override
  PersonByIdProvider getProviderOverride(
    covariant PersonByIdProvider provider,
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
  String? get name => r'personByIdProvider';
}

/// See also [personById].
class PersonByIdProvider extends FutureProvider<PersonModel> {
  /// See also [personById].
  PersonByIdProvider(
    String id,
  ) : this._internal(
          (ref) => personById(
            ref as PersonByIdRef,
            id,
          ),
          from: personByIdProvider,
          name: r'personByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personByIdHash,
          dependencies: PersonByIdFamily._dependencies,
          allTransitiveDependencies:
              PersonByIdFamily._allTransitiveDependencies,
          id: id,
        );

  PersonByIdProvider._internal(
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
    FutureOr<PersonModel> Function(PersonByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PersonByIdProvider._internal(
        (ref) => create(ref as PersonByIdRef),
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
  FutureProviderElement<PersonModel> createElement() {
    return _PersonByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PersonByIdRef on FutureProviderRef<PersonModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PersonByIdProviderElement extends FutureProviderElement<PersonModel>
    with PersonByIdRef {
  _PersonByIdProviderElement(super.provider);

  @override
  String get id => (origin as PersonByIdProvider).id;
}

String _$personParticipationsHash() =>
    r'3fb4bfe3fba37247c1c5f1c0b727b7a546c624a0';

/// See also [personParticipations].
@ProviderFor(personParticipations)
const personParticipationsProvider = PersonParticipationsFamily();

/// See also [personParticipations].
class PersonParticipationsFamily
    extends Family<AsyncValue<List<GenericSlide>>> {
  /// See also [personParticipations].
  const PersonParticipationsFamily();

  /// See also [personParticipations].
  PersonParticipationsProvider call(
    String id,
  ) {
    return PersonParticipationsProvider(
      id,
    );
  }

  @override
  PersonParticipationsProvider getProviderOverride(
    covariant PersonParticipationsProvider provider,
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
  String? get name => r'personParticipationsProvider';
}

/// See also [personParticipations].
class PersonParticipationsProvider extends FutureProvider<List<GenericSlide>> {
  /// See also [personParticipations].
  PersonParticipationsProvider(
    String id,
  ) : this._internal(
          (ref) => personParticipations(
            ref as PersonParticipationsRef,
            id,
          ),
          from: personParticipationsProvider,
          name: r'personParticipationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personParticipationsHash,
          dependencies: PersonParticipationsFamily._dependencies,
          allTransitiveDependencies:
              PersonParticipationsFamily._allTransitiveDependencies,
          id: id,
        );

  PersonParticipationsProvider._internal(
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
    FutureOr<List<GenericSlide>> Function(PersonParticipationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PersonParticipationsProvider._internal(
        (ref) => create(ref as PersonParticipationsRef),
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
  FutureProviderElement<List<GenericSlide>> createElement() {
    return _PersonParticipationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonParticipationsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PersonParticipationsRef on FutureProviderRef<List<GenericSlide>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PersonParticipationsProviderElement
    extends FutureProviderElement<List<GenericSlide>>
    with PersonParticipationsRef {
  _PersonParticipationsProviderElement(super.provider);

  @override
  String get id => (origin as PersonParticipationsProvider).id;
}

String _$popularPeopleHash() => r'505e8c9d4987e0ac947c8a0fd4d47195e8a133ff';

/// See also [PopularPeople].
@ProviderFor(PopularPeople)
final popularPeopleProvider =
    AutoDisposeNotifierProvider<PopularPeople, List<GenericSlide>>.internal(
  PopularPeople.new,
  name: r'popularPeopleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularPeopleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PopularPeople = AutoDisposeNotifier<List<GenericSlide>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
