import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/errors/app_exception.dart';
import '../../../shared/models/auth_models.dart';

abstract class AuthService {
  Future<UserData> login(String email, String password);
  Future<UserData> register(String email, String name, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String> uploadPhoto(File photo);
  Future<UserData> getCurrentUser();
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

  @override
  Future<String> uploadPhoto(File photo) async {
    try {
      // Dosya uzantısını al
      final extension = photo.path.split('.').last;
      final filename = 'profile_photo.$extension';
      
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          photo.path,
          filename: filename,
        ),
      });


      final response = await _apiClient.post(
        '/user/upload_photo',
        data: formData,
      );

      print('Upload response: ${response.data}');
      return response.data['data']['photoUrl'] as String;
    } on AppException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('Upload error: $e');
      }
      throw UnknownException(
        message: 'Fotoğraf yüklenirken bir hata oluştu',
        originalError: e,
      );
    }
  }

  @override
  Future<UserData> getCurrentUser() async {
    try {
      final response = await _apiClient.get('/user/profile');
      final userData = UserData.fromJson(response.data['data']);
      return userData;
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: 'Kullanıcı bilgileri alınırken bir hata oluştu',
        originalError: e,
      );
    }
  }

} 