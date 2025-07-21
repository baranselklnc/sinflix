import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import '../services/dependency_injection.dart';
import '../storage/storage_service.dart';

part 'locale_controller.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  late final StorageService _storageService;

  @override
  Locale build() {
    _storageService = getIt<StorageService>();
    // Varsayılan olarak Türkçe ile başla, sonra async olarak güncelle
    _initializeLocale();
    return const Locale('tr', 'TR');
  }

  Future<void> _initializeLocale() async {
    try {
      final languageCode = await _storageService.getString('language_code') ?? 'tr';
      final countryCode = await _storageService.getString('country_code') ?? 'TR';
      final savedLocale = Locale(languageCode, countryCode);
      
      // Eğer farklıysa state'i güncelle
      if (state != savedLocale) {
        state = savedLocale;
      }
    } catch (e) {
      // Hata durumunda varsayılan dilde kal
      if (kDebugMode) {
        print('Error loading saved locale: $e');
      }
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    await _storageService.setString('language_code', newLocale.languageCode);
    await _storageService.setString('country_code', newLocale.countryCode ?? '');
    state = newLocale;
  }

  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'tr':
        return 'Türkçe';
      case 'en':
        return 'English';
      default:
        return 'Türkçe';
    }
  }

  String getLanguageFlag(String languageCode) {
    switch (languageCode) {
      case 'tr':
        return '🇹🇷';
      case 'en':
        return '🇺🇸';
      default:
        return '🇹🇷';
    }
  }
} 