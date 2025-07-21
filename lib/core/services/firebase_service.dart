import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../../firebase_options.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final Logger _logger = Logger();
  late FirebaseAnalytics _analytics;
  late FirebaseCrashlytics _crashlytics;

  /// Firebase'i başlat
  Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      
      _analytics = FirebaseAnalytics.instance;
      _crashlytics = FirebaseCrashlytics.instance;
      
       
      if (kDebugMode) {
        await _crashlytics.setCrashlyticsCollectionEnabled(false);
        
        await _analytics.setAnalyticsCollectionEnabled(true);
      } else {
        await _crashlytics.setCrashlyticsCollectionEnabled(true);
        await _analytics.setAnalyticsCollectionEnabled(true);
      }
      
      _logger.i('Firebase initialized successfully');
    } catch (e) {
      _logger.e('Failed to initialize Firebase: $e');
    }
  }

  /// Analytics event gönder
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(
        name: name,
        parameters: parameters,
      );
      _logger.d('Analytics event logged: $name');
    } catch (e) {
      _logger.e('Failed to log analytics event: $e');
    }
  }

  /// Kullanıcı özelliği ayarlar
  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      _logger.d('User property set: $name = $value');
    } catch (e) {
      _logger.e('Failed to set user property: $e');
    }
  }

  /// Kullanıcı ID'si ayarla
  Future<void> setUserId(String userId) async {
    try {
      await _analytics.setUserId(id: userId);
      await _crashlytics.setUserIdentifier(userId);
      _logger.d('User ID set: $userId');
    } catch (e) {
      _logger.e('Failed to set user ID: $e');
    }
  }

  /// Crashlytics'e hata gönder
  Future<void> recordError(
    dynamic error,
    StackTrace? stackTrace, {
    String? reason,
  }) async {
    try {
      await _crashlytics.recordError(
        error,
        stackTrace,
        reason: reason,
      );
      _logger.d('Error recorded in Crashlytics: $error');
    } catch (e) {
      _logger.e('Failed to record error in Crashlytics: $e');
    }
  }

  /// Crashlytics'e log gönder
  Future<void> log(String message) async {
    try {
      await _crashlytics.log(message);
      _logger.d('Log sent to Crashlytics: $message');
    } catch (e) {
      _logger.e('Failed to send log to Crashlytics: $e');
    }
  }

  /// Sayfa görüntüleme eventi
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass,
      );
      _logger.d('Screen view logged: $screenName');
    } catch (e) {
      _logger.e('Failed to log screen view: $e');
    }
  }

  /// Özel eventler için yardımcı methodlar
  Future<void> logLogin({required String method}) async {
    await logEvent(
      name: 'login',
      parameters: {'method': method},
    );
  }

  Future<void> logSignUp({required String method}) async {
    await logEvent(
      name: 'sign_up',
      parameters: {'method': method},
    );
  }

  Future<void> logMovieView({required String movieId, required String movieTitle}) async {
    await logEvent(
      name: 'movie_view',
      parameters: {
        'movie_id': movieId,
        'movie_title': movieTitle,
      },
    );
  }

  Future<void> logFavoriteToggle({required String movieId, required bool isFavorite}) async {
    await logEvent(
      name: 'favorite_toggle',
      parameters: {
        'movie_id': movieId,
        'is_favorite': isFavorite,
      },
    );
  }

  Future<void> logPhotoUpload() async {
    await logEvent(name: 'photo_upload');
  }

  Future<void> logThemeChange({required String theme}) async {
    await logEvent(
      name: 'theme_change',
      parameters: {'theme': theme},
    );
  }
} 