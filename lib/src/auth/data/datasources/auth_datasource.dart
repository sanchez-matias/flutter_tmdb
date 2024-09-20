import 'package:dio/dio.dart';
import 'package:flutter_tmdb/src/auth/data/models/user_model.dart';
import 'package:flutter_tmdb/src/auth/domain/entities/user.dart';

abstract class AuthDatasource {
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

class AuthDatasourceImpl extends AuthDatasource {
  final Dio dio;

  AuthDatasourceImpl(this.dio);

  @override
  Future<bool> authenticateUser({
    required String username,
    required String password,
    required String token,
  }) async {
    final response = await dio.post('/authentication/token/validate_with_login', queryParameters: {
      'username': username,
      'password': password,
      'request_token': token,
    });

    return response.data['success'];
  }

  @override
  Future<void> deleteSession(String? sessionId) async {
    if (sessionId == null) return;
    await dio.delete('/authentication/session', queryParameters: {
      'session_id': sessionId,
    });
  }

  @override
  Future<String> getGuestSessionId() async {
    final response = await dio.get('/authentication/guest_session/new');

    return response.data['guest_session_id'];
  }

  @override
  Future<String> getRequestToken() async {
    final response = await dio.get('/authentication/token/new');

    return response.data['request_token'];
  }

  @override
  Future<String> getSessionId(String token) async {
    final response = await dio.get('/authentication/session/new', queryParameters: {
      'request_token': token,
    });

    return response.data['session_id'];
  }
  
  @override
  Future<User> getUserDetails(String sessionId) async {
    final response = await dio.get('/account', queryParameters: {
      'session_id': sessionId,
    });

    return UserModel.fromJson(response.data);
  }
}
