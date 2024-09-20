import 'package:flutter_tmdb/src/auth/data/datasources/auth_datasource.dart';
import 'package:flutter_tmdb/src/auth/domain/entities/user.dart';
import 'package:flutter_tmdb/src/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<bool> authenticateUser({
    required String username,
    required String password,
    required String token,
  }) {
    return _datasource.authenticateUser(
      username: username,
      password: password,
      token: token,
    );
  }

  @override
  Future<void> deleteSession(String? sessionId) {
    return _datasource.deleteSession(sessionId);
  }

  @override
  Future<String> getGuestSessionId() {
    return _datasource.getGuestSessionId();
  }

  @override
  Future<String> getRequestToken() {
    return _datasource.getRequestToken();
  }

  @override
  Future<String> getSessionId(String token) {
    return _datasource.getSessionId(token);
  }

  @override
  Future<User> getUserDetails(String sessionId) {
    return _datasource.getUserDetails(sessionId);
  }
}
