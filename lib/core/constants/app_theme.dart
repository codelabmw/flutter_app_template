import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  // Configurations shared accross theme variations.
  static final TextTheme _textTheme = GoogleFonts.poppinsTextTheme();

  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    textTheme: _textTheme,
  );

  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    textTheme: _textTheme,
  );
}
