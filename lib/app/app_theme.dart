import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// CakeCab App Theme - pastel and soft colors with Google Fonts
class CakeCabTheme {
  // Color palette
  static const Color cream = Color(0xFFFFF3E0);
  static const Color pink = Color(0xFFFFC1E3);
  static const Color brown = Color(0xFF6D4C41);

  // Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: cream,
      primaryColor: pink,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: CakeCabTheme.cream, // pastel cream background
        elevation: 0,
        surfaceTintColor: Colors.transparent, // This prevents scroll-based color blending
        titleTextStyle: GoogleFonts.pacifico(
          fontSize: 22,
          color: CakeCabTheme.brown,
        ),
        iconTheme: IconThemeData(color: CakeCabTheme.brown),
      ),
    );
  }
}
