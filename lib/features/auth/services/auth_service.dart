import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../../core/errors/app_exception.dart';
import '../../../shared/models/auth_models.dart';

abstract class AuthService {
  Future<UserData> login(String email, String password);
  Future<UserData> register(String email, String name, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
}

class AuthServiceImpl implements AuthService {
  final ApiClient _apiClient;

  AuthServiceImpl(this._apiClient);

  @override
  Future<UserData> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      
      final response = await _apiClient.post(
        '/user/login',
        data: request.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(response.data);
      
      // Token'ı API client'a set et
      _apiClient.setAuthToken(loginResponse.data.token);
      
      return loginResponse.data;
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: 'Giriş yapılırken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<UserData> register(String email, String name, String password) async {
    try {
      final request = RegisterRequest(
        email: email,
        name: name,
        password: password,
      );
      
      final response = await _apiClient.post(
        '/user/register',
        data: request.toJson(),
      );

      final registerResponse = LoginResponse.fromJson(response.data);
      
      // Token'ı API client'a set et
      _apiClient.setAuthToken(registerResponse.data.token);
      
      return registerResponse.data;
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: 'Kayıt olurken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      _apiClient.removeAuthToken();
    } catch (e) {
      throw UnknownException(
        message: 'Çıkış yapılırken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    // Bu method token'ın varlığını kontrol eder
    // Gerçek implementasyonda token'ın geçerliliğini de kontrol edebiliriz
    return true; // Şimdilik true döndürüyoruz
  }
} 