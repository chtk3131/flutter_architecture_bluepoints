import 'package:flutter/material.dart';

// 色調を変えるやつ
abstract class ThemeDataSourceBase {
  Future<ThemeMode> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}
