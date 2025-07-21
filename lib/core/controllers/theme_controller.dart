import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/dependency_injection.dart';
import '../storage/storage_service.dart';
import '../theme/app_theme.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  late final StorageService _storageService;
  static const String _themeKey = 'app_theme_mode';

  @override
  AppThemeMode build() {
    _storageService = getIt<StorageService>();
    return AppThemeMode.dark; // Varsayılan tema
  }

  Future<void> initializeTheme() async {
    try {
      final savedTheme = await _storageService.getString(_themeKey);
      if (savedTheme != null) {
        final themeMode = AppThemeMode.values.firstWhere(
          (mode) => mode.name == savedTheme,
          orElse: () => AppThemeMode.dark,
        );
        state = themeMode;
      }
    } catch (e) {
      // Hata durumunda varsayılan temayı kullan
      state = AppThemeMode.dark;
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = state == AppThemeMode.dark 
        ? AppThemeMode.light 
        : AppThemeMode.dark;
    
    await _storageService.setString(_themeKey, newTheme.name);
    state = newTheme;
  }

  Future<void> setTheme(AppThemeMode themeMode) async {
    await _storageService.setString(_themeKey, themeMode.name);
    state = themeMode;
  }

  bool get isDarkMode => state == AppThemeMode.dark;
  bool get isLightMode => state == AppThemeMode.light;
} 