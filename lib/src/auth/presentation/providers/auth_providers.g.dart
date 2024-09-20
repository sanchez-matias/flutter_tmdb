// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggedUserHash() => r'd5ff3d2c55107131620c9534b053ba7cd6a7ddb6';

/// See also [loggedUser].
@ProviderFor(loggedUser)
final loggedUserProvider = FutureProvider<User?>.internal(
  loggedUser,
  name: r'loggedUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggedUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggedUserRef = FutureProviderRef<User?>;
String _$authenticationHash() => r'677c42325276ffdb6d1fbd2660d04045a78490df';

/// See also [Authentication].
@ProviderFor(Authentication)
final authenticationProvider =
    NotifierProvider<Authentication, AuthState>.internal(
  Authentication.new,
  name: r'authenticationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Authentication = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
