class AppConstants {
  // API Constants
  static const String baseUrl = 'https://caseapi.servicelabs.tech';
  static const String apiVersion = '';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  
  // Pagination
  static const int pageSize = 5;
  static const int initialPage = 1;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
  
  // Image Constants
  static const String defaultProfileImage = 'assets/images/default_profile.png';
  static const String defaultMoviePoster = 'assets/images/default_movie_poster.png';
  
  // Error Messages
  static const String networkErrorMessage = 'İnternet bağlantınızı kontrol edin';
  static const String serverErrorMessage = 'Sunucu hatası oluştu';
  static const String unknownErrorMessage = 'Bilinmeyen bir hata oluştu';
} 