// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/services/dependency_injection.dart';
import 'core/constants/app_colors.dart';
import 'core/widgets/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/controllers/theme_controller.dart';
import 'core/localization/locale_controller.dart';
import 'core/localization/app_localizations.dart';
import 'features/auth/views/login_screen.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/home/views/home_screen.dart';
import 'features/profile/views/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup dependencies
  await setupDependencies();
  
  runApp(
    const ProviderScope(
      child: SinFlixApp(),
    ),
  );
}

class SinFlixApp extends ConsumerStatefulWidget {
  const SinFlixApp({super.key});

  @override
  ConsumerState<SinFlixApp> createState() => _SinFlixAppState();
}

class _SinFlixAppState extends ConsumerState<SinFlixApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Tema başlatma
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(themeControllerProvider.notifier).initializeTheme();
    });
  }

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeControllerProvider);
    final locale = ref.watch(localeControllerProvider);
    
    return MaterialApp(
      title: 'SinFlix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(themeMode),
      locale: locale,
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: _showSplash
          ? SplashScreen(onAnimationComplete: _onSplashComplete)
          : _buildHome(),
    );
  }

  Widget _buildHome() {
    final authState = ref.watch(authControllerProvider);
    
    
    return authState.when(
      data: (userData) {
        if (userData == null) {
          return const LoginScreen();
        }
        
        return _MainNavigationScreen();
      },
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ),
      error: (error, stackTrace) => const LoginScreen(),
    );
  }
}

class _MainNavigationScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<_MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocale = ref.watch(localeControllerProvider);
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
              _buildNavItem(
                iconPath: 'assets/icons/homepage.png',
                icon: null,
                label: currentLocale.languageCode == 'en' ? 'Home' : 'Anasayfa',
                isSelected: _currentIndex == 0,
                onTap: () => setState(() => _currentIndex = 0),
              ),
              _buildNavItem(
                iconPath: 'assets/icons/profile_icon.png',
                icon: null,
                label: currentLocale.languageCode == 'en' ? 'Profile' : 'Profil',
                isSelected: _currentIndex == 1,
                onTap: () => setState(() => _currentIndex = 1),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String? iconPath,
    required IconData? icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected 
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected 
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconPath != null)
              Image.asset(
                iconPath,
                width: 24,
                height: 24,
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              )
            else if (icon != null)
              Icon(
                icon,
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                size: 24,
              ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
