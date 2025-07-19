import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import '../constants/app_constants.dart';
import '../errors/app_exception.dart';

abstract class StorageService {
  Future<void> init();
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<void> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> setObject(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> getObject(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class StorageServiceImpl implements StorageService {
  late SharedPreferences _prefs;
  late Box _hiveBox;
  final Logger _logger = Logger();

  @override
  Future<void> init() async {
    try {
      // Initialize SharedPreferences
      _prefs = await SharedPreferences.getInstance();
      
      // Initialize Hive
      await Hive.initFlutter();
      _hiveBox = await Hive.openBox('sinflix_cache');
      
      _logger.i('Storage service initialized successfully');
    } catch (e) {
      _logger.e('Failed to initialize storage service: $e');
      throw CacheException(
        message: 'Storage servisi başlatılamadı',
        originalError: e,
      );
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    try {
      await _prefs.setString(key, value);
      _logger.d('String saved: $key = $value');
    } catch (e) {
      _logger.e('Failed to save string: $key, error: $e');
      throw CacheException(
        message: 'Veri kaydedilemedi',
        originalError: e,
      );
    }
  }

  @override
  Future<String?> getString(String key) async {
    try {
      final value = _prefs.getString(key);
      _logger.d('String retrieved: $key = $value');
      return value;
    } catch (e) {
      _logger.e('Failed to get string: $key, error: $e');
      throw CacheException(
        message: 'Veri alınamadı',
        originalError: e,
      );
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    try {
      await _prefs.setBool(key, value);
      _logger.d('Bool saved: $key = $value');
    } catch (e) {
      _logger.e('Failed to save bool: $key, error: $e');
      throw CacheException(
        message: 'Veri kaydedilemedi',
        originalError: e,
      );
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    try {
      final value = _prefs.getBool(key);
      _logger.d('Bool retrieved: $key = $value');
      return value;
    } catch (e) {
      _logger.e('Failed to get bool: $key, error: $e');
      throw CacheException(
        message: 'Veri alınamadı',
        originalError: e,
      );
    }
  }

  @override
  Future<void> setInt(String key, int value) async {
    try {
      await _prefs.setInt(key, value);
      _logger.d('Int saved: $key = $value');
    } catch (e) {
      _logger.e('Failed to save int: $key, error: $e');
      throw CacheException(
        message: 'Veri kaydedilemedi',
        originalError: e,
      );
    }
  }

  @override
  Future<int?> getInt(String key) async {
    try {
      final value = _prefs.getInt(key);
      _logger.d('Int retrieved: $key = $value');
      return value;
    } catch (e) {
      _logger.e('Failed to get int: $key, error: $e');
      throw CacheException(
        message: 'Veri alınamadı',
        originalError: e,
      );
    }
  }

  @override
  Future<void> setObject(String key, Map<String, dynamic> value) async {
    try {
      final jsonString = jsonEncode(value);
      await _prefs.setString(key, jsonString);
      _logger.d('Object saved: $key');
    } catch (e) {
      _logger.e('Failed to save object: $key, error: $e');
      throw CacheException(
        message: 'Veri kaydedilemedi',
        originalError: e,
      );
    }
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    try {
      final jsonString = _prefs.getString(key);
      if (jsonString == null) return null;
      
      final value = jsonDecode(jsonString) as Map<String, dynamic>;
      _logger.d('Object retrieved: $key');
      return value;
    } catch (e) {
      _logger.e('Failed to get object: $key, error: $e');
      throw CacheException(
        message: 'Veri alınamadı',
        originalError: e,
      );
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      await _prefs.remove(key);
      _logger.d('Key removed: $key');
    } catch (e) {
      _logger.e('Failed to remove key: $key, error: $e');
      throw CacheException(
        message: 'Veri silinemedi',
        originalError: e,
      );
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _prefs.clear();
      await _hiveBox.clear();
      _logger.d('Storage cleared');
    } catch (e) {
      _logger.e('Failed to clear storage: $e');
      throw CacheException(
        message: 'Depolama temizlenemedi',
        originalError: e,
      );
    }
  }

  // Hive specific methods for caching
  Future<void> setCacheData(String key, dynamic value) async {
    try {
      await _hiveBox.put(key, value);
      _logger.d('Cache data saved: $key');
    } catch (e) {
      _logger.e('Failed to save cache data: $key, error: $e');
      throw CacheException(
        message: 'Cache verisi kaydedilemedi',
        originalError: e,
      );
    }
  }

  dynamic getCacheData(String key) {
    try {
      final value = _hiveBox.get(key);
      _logger.d('Cache data retrieved: $key');
      return value;
    } catch (e) {
      _logger.e('Failed to get cache data: $key, error: $e');
      throw CacheException(
        message: 'Cache verisi alınamadı',
        originalError: e,
      );
    }
  }

  Future<void> removeCacheData(String key) async {
    try {
      await _hiveBox.delete(key);
      _logger.d('Cache data removed: $key');
    } catch (e) {
      _logger.e('Failed to remove cache data: $key, error: $e');
      throw CacheException(
        message: 'Cache verisi silinemedi',
        originalError: e,
      );
    }
  }
} 