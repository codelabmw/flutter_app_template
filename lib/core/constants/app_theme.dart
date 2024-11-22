import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith();
  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith();
}
