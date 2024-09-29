// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appRouterHash() => r'1a7802f26ae96c0cd6f1bcc35a910fda46566b61';

/// See also [appRouter].
@ProviderFor(appRouter)
final appRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  appRouter,
  name: r'appRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppRouterRef = AutoDisposeProviderRef<GoRouter>;
String _$drawerDestinationsHash() =>
    r'07d195ed4dc4bfbfa29590ed2ce4e010a0ca8f34';

/// See also [DrawerDestinations].
@ProviderFor(DrawerDestinations)
final drawerDestinationsProvider = AutoDisposeNotifierProvider<
    DrawerDestinations, List<MenuDestination>>.internal(
  DrawerDestinations.new,
  name: r'drawerDestinationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$drawerDestinationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DrawerDestinations = AutoDisposeNotifier<List<MenuDestination>>;
String _$homeIndexHash() => r'550b8dcf4d3cd88d0c57359a6c34489db32e1762';

/// See also [HomeIndex].
@ProviderFor(HomeIndex)
final homeIndexProvider = AutoDisposeNotifierProvider<HomeIndex, int>.internal(
  HomeIndex.new,
  name: r'homeIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
