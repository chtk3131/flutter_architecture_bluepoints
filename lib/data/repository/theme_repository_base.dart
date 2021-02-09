import 'package:flutter/material.dart';

abstract class ThemeRepositoryBase {
  Future<ThemeMode> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode themeMode);
}
