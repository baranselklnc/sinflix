import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFFE50914); // Netflix Red
  static const Color primaryDark = Color(0xFFB2070F);
  static const Color primaryLight = Color(0xFFFF1A1A);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF564D4D);
  static const Color secondaryDark = Color(0xFF2D2D2D);
  static const Color secondaryLight = Color(0xFF8A8A8A);
  
  // Background Colors
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF141414);
  static const Color cardBackground = Color(0xFF1F1F1F);
  
  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textTertiary = Color(0xFF737373);
  
  // Status Colors
  static const Color success = Color(0xFF00D4AA);
  static const Color warning = Color(0xFFFFB800);
  static const Color error = Color(0xFFFF4444);
  static const Color info = Color(0xFF2196F3);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, surface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);
} 