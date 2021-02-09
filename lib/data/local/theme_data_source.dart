import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import './app_shared_preferences.dart';
import 'theme_data_source_base.dart';

class ThemeDataSource extends ThemeDataSourceBase {
  final AppSharedPreferences _prefs;
  static const String keyThemeMode = "theme_mode";

  ThemeDataSource(this._prefs);

  @override
  Future<ThemeMode> loadThemeMode() async {
    final prefs = await _prefs.getInstance();
    return EnumToString.fromString(
      ThemeMode.values,
      prefs.getString(keyThemeMode),
    );
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) async {
    final prefs = await _prefs.getInstance();
    return prefs.setString(
      keyThemeMode,
      EnumToString.convertToString(theme),
    );
  }
}
