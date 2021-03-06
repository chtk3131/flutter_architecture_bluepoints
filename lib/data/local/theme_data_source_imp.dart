import 'package:flutter/material.dart';

// 色調を変えるやつ
abstract class ThemeDataSourceImpl {
  Future<ThemeMode> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}
