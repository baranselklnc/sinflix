import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ?? AppLocalizations(const Locale('tr', 'TR'));
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'tr': {
      'appTitle': 'SinFlix',
      'welcome': 'Merhabalar',
      'welcomeSubtitle': 'Baransel Kilinç | NodeLabs Case Study Hoşgeldiniz!',
      'email': 'E-posta',
      'password': 'Şifre',
      'login': 'Giriş Yap',
      'register': 'Kayıt Ol',
      'forgotPassword': 'Şifremi unuttum',
      'noAccount': 'Bir hesabın yok mu?',
      'home': 'Anasayfa',
      'profile': 'Profil',
      'profileDetails': 'Profil Detayı',
      'userNotFound': 'Kullanıcı bulunamadı',
      'limitedOffer': 'Sınırlı Teklif',
      'addPhoto': 'Fotoğraf Ekle',
      'likedMovies': 'Beğendiğim Filmler',
      'themeSettings': 'Tema Ayarları',
      'darkMode': 'Karanlık Mod',
      'darkModeDescription': 'Gözlerinizi korumak için karanlık temayı kullanın',
      'noTitle': 'Başlık Yok',
      'noYear': 'Yıl Yok',
      'noGenre': 'Tür Yok',
      'noDuration': 'Süre Yok',
      'noDescription': 'Açıklama Yok',
      'director': 'Yönetmen',
      'noRating': 'Rating Yok',
      'readMore': 'Daha Fazlası',
      'emailRequired': 'E-posta adresi gerekli',
      'validEmailRequired': 'Geçerli bir e-posta adresi girin',
      'passwordRequired': 'Şifre gerekli',
      'passwordMinLength': 'Şifre en az 6 karakter olmalı',
      'unknownError': 'Bilinmeyen bir hata oluştu',
      'registerError': 'Kayıt olurken bir hata oluştu',
      'logoutError': 'Çıkış yapılırken hata oluştu',
      'moviesLoadError': 'Filmler yüklenirken bir hata oluştu',
      'tryAgain': 'Tekrar Dene',
      'loading': 'Yükleniyor...',
      'noMoviesYet': 'Henüz film bulunmuyor',
      'noFavoriteMovies': 'Henüz beğendiğiniz film bulunmuyor',
      'favoriteMoviesHint': 'Filmleri beğenmek için anasayfadaki kalp ikonuna tıklayın',
      'premiumDescription': 'Jeton paketin\'ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
      'selectTokenPackage': 'Kilidi açmak için bir jeton paketi seçin',
      'token': 'Jeton',
      'weeklyPer': 'Başına haftalık',
      'continue': 'Devam Et',
      'accountCreatedSuccess': 'Hesabınız başarıyla oluşturuldu!',
      'startEnjoyingMovies': 'Film dünyasının keyfini çıkarmaya başlayabilirsiniz.',
      'success': 'Başarılı!',
      'termsAndConditions': 'Kullanıcı Sözleşmesi',
      'privacyPolicy': 'Gizlilik Politikası',
      'acceptTerms': 'Kayıt olarak Kullanıcı Sözleşmesi ve Gizlilik Politikası kabul etmiş olursunuz.',
      'terms': 'Kullanıcı Sözleşmesi',
      'privacy': 'Gizlilik Politikası',
      'alreadyHaveAccount': 'Zaten hesabın var mı?',
      'nameRequired': 'Ad soyad gerekli',
      'nameMinLength': 'Ad soyad en az 2 karakter olmalı',
      'confirmPasswordRequired': 'Şifre tekrarı gerekli',
      'passwordsDoNotMatch': 'Şifreler eşleşmiyor',
      'testCrashSent': 'Test crash gönderildi!',
      'languageSettings': 'Dil Ayarları',
      'languageDescription': 'Tercih ettiğiniz dili seçin',
      'turkish': 'Türkçe',
      'english': 'İngilizce',
      'darkTheme': 'Karanlık Tema',
      'lightTheme': 'Aydınlık Tema',
      'anErrorOccurred': 'Bir hata oluştu',
      'noMoviesAvailable': 'Henüz film bulunmuyor',
      'moviesLoadErrorProfile': 'Filmler yüklenirken hata oluştu',
      'name': 'Ad Soyad',
      'confirmPassword': 'Şifre Tekrar',
      'close': 'Kapat',
      'favoriteMovies': 'Favori Filmlerim',
      'plot': 'Özet',
      'details': 'Detaylar',
      'genre': 'Tür',
      'writer': 'Senarist',
      'actors': 'Oyuncular',
      'language': 'Dil',
      'country': 'Ülke',
      'metascore': 'Metascore',
      'imdbVotes': 'IMDB Oyları',
      'awards': 'Ödüller',
      'gallery': 'Galeri',
      'notSpecified': 'Belirtilmemiş',
      'uploadPhotoTitle': 'Fotoğraflarınızı Yükleyin',
      'uploadPhotoSubtitle': 'Profil fotoğrafınızı seçerek kişiselleştirin',
      'selectPhoto': 'Fotoğraf Seç',
      'selectPhotoFromGallery': 'Galeriden fotoğraf seçin',
      'pleaseSelectPhoto': 'Lütfen bir fotoğraf seçin',
      'photoUploadSuccess': 'Fotoğraf başarıyla yüklendi',
      'photoUploadError': 'Fotoğraf yüklenirken hata oluştu',
      'photoSelectionError': 'Fotoğraf seçilirken hata oluştu',
      'bonuses': 'Alacağınız Bonuslar',
      'premiumAccount': 'Premium\nHesap',
      'moreMatches': 'Daha Fazla\nEşleşme',
      'featured': 'Öne\nÇıkarma',
      'moreLikes': 'Daha Fazla\nBeğeni',
      'seeAllTokens': 'Tüm Jetonları Gör',
      'createAccountDescription': 'Film dünyasına katılmak için hesap oluşturun',
      'termsAndConditionsTitle': 'Kullanıcı Sözleşmesi',
      'privacyPolicyTitle': 'Gizlilik Politikası',
      'termsContent': 'Bu Kullanıcı Sözleşmesi ("Sözleşme"), SinFlix uygulamasını kullanımınızı düzenler.\n\n'
          '1. Hizmet Kullanımı\n'
          'SinFlix, film ve dizi izleme hizmeti sunar. Hizmeti kullanarak bu sözleşmeyi kabul etmiş olursunuz.\n\n'
          '2. Hesap Güvenliği\n'
          'Hesap bilgilerinizi güvenli tutmak sizin sorumluluğunuzdadır.\n\n'
          '3. İçerik Kullanımı\n'
          'Tüm içerik telif hakkı korumalıdır ve sadece kişisel kullanım için izin verilir.\n\n'
          '4. Değişiklikler\n'
          'Bu sözleşme önceden haber verilmeksizin değiştirilebilir.\n\n'
          '5. İletişim\n'
          'Sorularınız için baranselklnc@gmail.com adresine yazabilirsiniz.',
      'privacyContent': 'Bu Gizlilik Politikası, kişisel verilerinizin nasıl toplandığını ve kullanıldığını açıklar.\n\n'
          '1. Toplanan Veriler\n'
          'E-posta adresi, ad soyad ve kullanım verileri toplanır.\n\n'
          '2. Veri Kullanımı\n'
          'Verileriniz hizmet kalitesini artırmak için kullanılır.\n\n'
          '3. Veri Güvenliği\n'
          'Verileriniz güvenli sunucularda saklanır ve şifrelenir.\n\n'
          '4. Üçüncü Taraf Paylaşımı\n'
          'Verileriniz üçüncü taraflarla paylaşılmaz.\n\n'
          '5. Çerezler\n'
          'Deneyiminizi iyileştirmek için çerezler kullanılır.\n\n'
          '6. Değişiklikler\n'
          'Bu politika güncellenebilir ve değişiklikler size bildirilir.',
    },
    'en': {
      'appTitle': 'SinFlix',
      'welcome': 'Hello',
      'welcomeSubtitle': 'Baransel Kilinç | NodeLabs Case Study Welcome!',
      'email': 'Email',
      'password': 'Password',
      'login': 'Login',
      'register': 'Register',
      'forgotPassword': 'Forgot Password',
      'noAccount': 'Don\'t have an account?',
      'home': 'Home',
      'profile': 'Profile',
      'profileDetails': 'Profile Details',
      'userNotFound': 'User not found',
      'limitedOffer': 'Limited Offer',
      'addPhoto': 'Add Photo',
      'likedMovies': 'Liked Movies',
      'themeSettings': 'Theme Settings',
      'darkMode': 'Dark Mode',
      'darkModeDescription': 'Use dark theme to protect your eyes',
      'noTitle': 'No Title',
      'noYear': 'No Year',
      'noGenre': 'No Genre',
      'noDuration': 'No Duration',
      'noDescription': 'No Description',
      'director': 'Director',
      'noRating': 'No Rating',
      'readMore': 'Read More',
      'emailRequired': 'Email is required',
      'validEmailRequired': 'Please enter a valid email address',
      'passwordRequired': 'Password is required',
      'passwordMinLength': 'Password must be at least 6 characters',
      'unknownError': 'An unknown error occurred',
      'registerError': 'An error occurred while registering',
      'logoutError': 'An error occurred while logging out',
      'moviesLoadError': 'An error occurred while loading movies',
      'tryAgain': 'Try Again',
      'loading': 'Loading...',
      'noMoviesYet': 'No movies yet',
      'noFavoriteMovies': 'You haven\'t liked any movies yet',
      'favoriteMoviesHint': 'Click the heart icon on the homepage to like movies',
      'premiumDescription': 'Choose a token package to earn bonuses and unlock new episodes!',
      'selectTokenPackage': 'Select a token package to unlock',
      'token': 'Token',
      'weeklyPer': 'Weekly per',
      'continue': 'Continue',
      'accountCreatedSuccess': 'Your account has been successfully created!',
      'startEnjoyingMovies': 'You can start enjoying the world of movies.',
      'success': 'Success!',
      'termsAndConditions': 'Terms and Conditions',
      'privacyPolicy': 'Privacy Policy',
      'acceptTerms': 'By registering, you accept the Terms and Conditions and Privacy Policy.',
      'terms': 'Terms and Conditions',
      'privacy': 'Privacy Policy',
      'alreadyHaveAccount': 'Already have an account?',
      'nameRequired': 'Name is required',
      'nameMinLength': 'Name must be at least 2 characters',
      'confirmPasswordRequired': 'Password confirmation is required',
      'passwordsDoNotMatch': 'Passwords do not match',
      'testCrashSent': 'Test crash sent!',
      'languageSettings': 'Language Settings',
      'languageDescription': 'Choose your preferred language',
      'turkish': 'Turkish',
      'english': 'English',
      'darkTheme': 'Dark Theme',
      'lightTheme': 'Light Theme',
      'anErrorOccurred': 'An error occurred',
      'noMoviesAvailable': 'No movies available',
      'moviesLoadErrorProfile': 'An error occurred while loading movies',
      'name': 'Full Name',
      'confirmPassword': 'Confirm Password',
      'close': 'Close',
      'favoriteMovies': 'My Favorite Movies',
      'plot': 'Plot',
      'details': 'Details',
      'genre': 'Genre',
      'writer': 'Writer',
      'actors': 'Actors',
      'language': 'Language',
      'country': 'Country',
      'metascore': 'Metascore',
      'imdbVotes': 'IMDB Votes',
      'awards': 'Awards',
      'gallery': 'Gallery',
      'notSpecified': 'Not Specified',
      'uploadPhotoTitle': 'Upload Your Photos',
      'uploadPhotoSubtitle': 'Personalize by selecting your profile photo',
      'selectPhoto': 'Select Photo',
      'selectPhotoFromGallery': 'Select photo from gallery',
      'pleaseSelectPhoto': 'Please select a photo',
      'photoUploadSuccess': 'Photo uploaded successfully',
      'photoUploadError': 'An error occurred while uploading photo',
      'photoSelectionError': 'An error occurred while selecting photo',
      'bonuses': 'Your Bonuses',
      'premiumAccount': 'Premium\nAccount',
      'moreMatches': 'More\nMatches',
      'featured': 'Featured',
      'moreLikes': 'More\nLikes',
      'seeAllTokens': 'See All Tokens',
      'createAccountDescription': 'Create an account to join the movie world',
      'termsAndConditionsTitle': 'Terms and Conditions',
      'privacyPolicyTitle': 'Privacy Policy',
      'termsContent': 'This Terms and Conditions Agreement ("Agreement") governs your use of the SinFlix application.\n\n'
          '1. Service Usage\n'
          'SinFlix provides film and series viewing services. By using the service, you accept this agreement.\n\n'
          '2. Account Security\n'
          'It is your responsibility to keep your account information secure.\n\n'
          '3. Content Usage\n'
          'All content is copyright protected and permitted only for personal use.\n\n'
          '4. Changes\n'
          'This agreement may be changed without prior notice.\n\n'
          '5. Contact\n'
          'You can write to baranselklnc@gmail.com for your questions.',
      'privacyContent': 'This Privacy Policy explains how your personal data is collected and used.\n\n'
          '1. Collected Data\n'
          'Email address, full name and usage data are collected.\n\n'
          '2. Data Usage\n'
          'Your data is used to improve service quality.\n\n'
          '3. Data Security\n'
          'Your data is stored on secure servers and encrypted.\n\n'
          '4. Third Party Sharing\n'
          'Your data is not shared with third parties.\n\n'
          '5. Cookies\n'
          'Cookies are used to improve your experience.\n\n'
          '6. Changes\n'
          'This policy can be updated and changes will be notified to you.',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['tr']![key] ?? key;
  }

  // Convenience getters
  String get appTitle => get('appTitle');
  String get welcome => get('welcome');
  String get welcomeSubtitle => get('welcomeSubtitle');
  String get email => get('email');
  String get password => get('password');
  String get login => get('login');
  String get register => get('register');
  String get forgotPassword => get('forgotPassword');
  String get noAccount => get('noAccount');
  String get home => get('home');
  String get profile => get('profile');
  String get profileDetails => get('profileDetails');
  String get userNotFound => get('userNotFound');
  String get limitedOffer => get('limitedOffer');
  String get addPhoto => get('addPhoto');
  String get likedMovies => get('likedMovies');
  String get themeSettings => get('themeSettings');
  String get darkMode => get('darkMode');
  String get darkModeDescription => get('darkModeDescription');
  String get noTitle => get('noTitle');
  String get noYear => get('noYear');
  String get noGenre => get('noGenre');
  String get noDuration => get('noDuration');
  String get noDescription => get('noDescription');
  String get director => get('director');
  String get noRating => get('noRating');
  String get readMore => get('readMore');
  String get emailRequired => get('emailRequired');
  String get validEmailRequired => get('validEmailRequired');
  String get passwordRequired => get('passwordRequired');
  String get passwordMinLength => get('passwordMinLength');
  String get unknownError => get('unknownError');
  String get registerError => get('registerError');
  String get logoutError => get('logoutError');
  String get moviesLoadError => get('moviesLoadError');
  String get tryAgain => get('tryAgain');
  String get loading => get('loading');
  String get noMoviesYet => get('noMoviesYet');
  String get noFavoriteMovies => get('noFavoriteMovies');
  String get favoriteMoviesHint => get('favoriteMoviesHint');
  String get premiumDescription => get('premiumDescription');
  String get selectTokenPackage => get('selectTokenPackage');
  String get token => get('token');
  String get weeklyPer => get('weeklyPer');
  String get continueText => get('continue');
  String get accountCreatedSuccess => get('accountCreatedSuccess');
  String get startEnjoyingMovies => get('startEnjoyingMovies');
  String get success => get('success');
  String get termsAndConditions => get('termsAndConditions');
  String get privacyPolicy => get('privacyPolicy');
  String get acceptTerms => get('acceptTerms');
  String get terms => get('terms');
  String get privacy => get('privacy');
  String get alreadyHaveAccount => get('alreadyHaveAccount');
  String get nameRequired => get('nameRequired');
  String get nameMinLength => get('nameMinLength');
  String get confirmPasswordRequired => get('confirmPasswordRequired');
  String get passwordsDoNotMatch => get('passwordsDoNotMatch');
  String get testCrashSent => get('testCrashSent');
  String get languageSettings => get('languageSettings');
  String get languageDescription => get('languageDescription');
  String get turkish => get('turkish');
  String get english => get('english');
  String get darkTheme => get('darkTheme');
  String get lightTheme => get('lightTheme');
  String get anErrorOccurred => get('anErrorOccurred');
  String get noMoviesAvailable => get('noMoviesAvailable');
  String get moviesLoadErrorProfile => get('moviesLoadErrorProfile');
  String get name => get('name');
  String get confirmPassword => get('confirmPassword');
  String get close => get('close');
  String get favoriteMovies => get('favoriteMovies');
  String get plot => get('plot');
  String get details => get('details');
  String get genre => get('genre');
  String get writer => get('writer');
  String get actors => get('actors');
  String get language => get('language');
  String get country => get('country');
  String get metascore => get('metascore');
  String get imdbVotes => get('imdbVotes');
  String get awards => get('awards');
  String get gallery => get('gallery');
  String get notSpecified => get('notSpecified');
  String get uploadPhotoTitle => get('uploadPhotoTitle');
  String get uploadPhotoSubtitle => get('uploadPhotoSubtitle');
  String get selectPhoto => get('selectPhoto');
  String get selectPhotoFromGallery => get('selectPhotoFromGallery');
  String get pleaseSelectPhoto => get('pleaseSelectPhoto');
  String get photoUploadSuccess => get('photoUploadSuccess');
  String get photoUploadError => get('photoUploadError');
  String get photoSelectionError => get('photoSelectionError');
  String get bonuses => get('bonuses');
  String get premiumAccount => get('premiumAccount');
  String get moreMatches => get('moreMatches');
  String get featured => get('featured');
  String get moreLikes => get('moreLikes');
  String get seeAllTokens => get('seeAllTokens');
  String get createAccountDescription => get('createAccountDescription');
  String get termsAndConditionsTitle => get('termsAndConditionsTitle');
  String get privacyPolicyTitle => get('privacyPolicyTitle');
  String get termsContent => get('termsContent');
  String get privacyContent => get('privacyContent');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['tr', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
} 