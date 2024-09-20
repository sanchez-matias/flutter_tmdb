import 'package:dio/dio.dart';
import 'package:flutter_tmdb/core/services/key_storage.dart';
import 'package:flutter_tmdb/src/auth/domain/entities/user.dart';
import 'package:flutter_tmdb/src/auth/presentation/providers/auth_repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {

  @override
  AuthState build() {
    validateAuthKey();
    return AuthState();
  }

  void validateAuthKey() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final lastId = SessionIdStorage().lastSessionId;
    if (lastId.isEmpty) return logout();

    try {
      // I chose a random request to verify if the last saved sessionId is valid.
      // Otherwise, it will throw an error and log out.
      await ref.read(authRepositoryProvider).getUserDetails(lastId);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        isGuest: false,
        sessionId: lastId,
        message: '',
      );
    } catch (e) {
      // print(e.toString());
      logout(message: 'Your last session has expired');
    }
  }

  Future<void> loginUser({required String username, required String password}) async {
    state = state.copyWith(isPosting: true);
    await Future.delayed(const Duration(milliseconds: 1000));

    try {
      final token = await ref.read(authRepositoryProvider).getRequestToken();
      await ref.read(authRepositoryProvider).authenticateUser(
            username: username,
            password: password,
            token: token,
          );

      final sessionId = await ref.read(authRepositoryProvider).getSessionId(token);
      SessionIdStorage().lastSessionId = sessionId;

      state = AuthState(
        status: AuthStatus.authenticated,
        isGuest: false,
        sessionId: sessionId,
      );

    } on DioException catch (e) {
      logout(message: e.response?.statusMessage ?? '');
    } catch (e) {
      // print(e.toString());
      logout(message: 'Unexpected Error Ocurred');
    }

    state = state.copyWith(isPosting: false);
  }

  Future<void> loginAsGuest() async {
    state = state.copyWith(isPosting: true);
    await Future.delayed(const Duration(milliseconds: 1000));

    try {
      final sessionId = await ref.read(authRepositoryProvider).getGuestSessionId();
      SessionIdStorage().lastSessionId = sessionId;

      state = AuthState(
        status: AuthStatus.authenticated,
        isGuest: true,
        sessionId: sessionId,
      );

    } on DioException catch (e) {
      logout(message: e.response?.statusMessage ?? '');
    } catch (e) {
      // print(e.toString());
      logout(message: 'Unexpected Error Ocurred');
    }

    state = state.copyWith(isPosting: false);
  }

  Future<void> logout({String message = ''}) async {
    if (!state.isGuest) {
      await ref.read(authRepositoryProvider).deleteSession(state.sessionId);
      SessionIdStorage().removeSessionId = 'sessionId';
    }

    state = state.copyWith(
      status: AuthStatus.notAuthenticated,
      isGuest: false,
      message: message,
      sessionId: null,
    );
  }
}

@Riverpod(keepAlive: true)
Future<User?> loggedUser(LoggedUserRef ref) async {
  final authState = ref.watch(authenticationProvider);
  if (authState.sessionId == null) return null;

  if (authState.isGuest) {
    return User(avatarPath: null, id: '0', name: 'Guest', username: 'guest_user');
  }

  final user = await ref.read(authRepositoryProvider).getUserDetails(authState.sessionId!);
  return user;
}

enum AuthStatus {
  checking('/loading'),
  authenticated('/home'),
  notAuthenticated('/login'),
  ;

  final String route;

  const AuthStatus(this.route);
}

class AuthState {
  final AuthStatus status;
  final bool isPosting;
  final bool isGuest;
  final String message;
  final String? sessionId;

  AuthState({
    this.status = AuthStatus.checking,
    this.isGuest = false,
    this.isPosting = false,
    this.message = '',
    this.sessionId,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? isGuest,
    bool? isPosting,
    String? message,
    String? sessionId,
  }) =>
      AuthState(
        status: status ?? this.status,
        isGuest: isGuest ?? this.isGuest,
        isPosting: isPosting ?? this.isPosting,
        message: message ?? this.message,
        sessionId: sessionId ?? this.sessionId,
      );
}
