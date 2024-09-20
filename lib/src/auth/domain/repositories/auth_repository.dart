import 'package:flutter_tmdb/src/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<String> getRequestToken();

  Future<bool> authenticateUser({
    required String username,
    required String password,
    required String token,
  });

  Future<String> getSessionId(String token);

  Future<String> getGuestSessionId();

  Future<void> deleteSession(String? sessionId);

  Future<User> getUserDetails(String sessionId);
}
