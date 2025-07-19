import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../constants/app_constants.dart';
import '../errors/app_exception.dart';
import '../storage/storage_service.dart';

class ApiClient {
  late final Dio _dio;
  final Logger _logger = Logger();
  final StorageService _storageService;

  ApiClient(this._storageService) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl + AppConstants.apiVersion,
        connectTimeout: Duration(milliseconds: AppConstants.connectionTimeout),
        receiveTimeout: Duration(milliseconds: AppConstants.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Token'ı otomatik olarak ekle
          final token = await _storageService.getString('token');
          if (token != null && token.isNotEmpty) {
            // API'de token "Bearer " prefix'i olmadan gönderiliyor
            options.headers['Authorization'] = token;
            print('API Request: Adding token - $token'); // Debug için
          } else {
            print('API Request: No token found'); // Debug için
          }
          
          // FormData için Content-Type'ı ayarla
          if (options.data is FormData) {
            options.headers['Content-Type'] = 'multipart/form-data';
            options.headers['Accept'] = 'application/json';
            print('API Request: Setting Content-Type for FormData');
          }
          
          _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
          _logger.i('REQUEST DATA: ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          _logger.i('RESPONSE DATA: ${response.data}');
          handler.next(response);
        },
        onError: (error, handler) {
          _logger.e(
            'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
          );
          _logger.e('ERROR MESSAGE: ${error.message}');
          _logger.e('ERROR RESPONSE DATA: ${error.response?.data}');
          _logger.e('ERROR RESPONSE HEADERS: ${error.response?.headers}');
          handler.next(error);
        },
      ),
    );
  }

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException(
        message: 'Bilinmeyen bir hata oluştu',
        originalError: e,
      );
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException(
        message: 'Bilinmeyen bir hata oluştu',
        originalError: e,
      );
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException(
        message: 'Bilinmeyen bir hata oluştu',
        originalError: e,
      );
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw UnknownException(
        message: 'Bilinmeyen bir hata oluştu',
        originalError: e,
      );
    }
  }

  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: AppConstants.networkErrorMessage,
          originalError: error,
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Sunucu hatası';
        
        if (statusCode == 401) {
          return AuthException(
            message: 'Oturum süreniz dolmuş',
            code: statusCode.toString(),
            originalError: error,
          );
        } else if (statusCode == 422) {
          return ValidationException(
            message: message,
            code: statusCode.toString(),
            fieldErrors: error.response?.data?['errors'],
            originalError: error,
          );
        } else if (statusCode! >= 500) {
          return ServerException(
            message: AppConstants.serverErrorMessage,
            code: statusCode.toString(),
            originalError: error,
          );
        } else {
          return ServerException(
            message: message,
            code: statusCode.toString(),
            originalError: error,
          );
        }
      case DioExceptionType.cancel:
        return NetworkException(
          message: 'İstek iptal edildi',
          originalError: error,
        );
      case DioExceptionType.connectionError:
        return NetworkException(
          message: AppConstants.networkErrorMessage,
          originalError: error,
        );
      default:
        return UnknownException(
          message: AppConstants.unknownErrorMessage,
          originalError: error,
        );
    }
  }
} 