import 'package:architecture_bluepoints/data/repository/theme_repository_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';

// いきなりprovider
// StateNotifierでやってみる
final appThemeNotifierProvider = StateNotifierProvider<AppTheme>((ref) {
  return AppTheme(ref.read(themeRepositoryProvider));
});

const headline1 = TextStyle(
  fontSize: 24,
  fontFamily: "Rotunda",
  fontWeight: FontWeight.bold,
);

const buttonTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontFamily: "Rotunda",
  fontWeight: FontWeight.bold,
);

const accentColor = Color(0xff17c063);
const errorColor = Color(0xffff5544);

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.notoSansTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      headline1: headline1,
      button: buttonTextStyle,
    ),
    accentColor: accentColor,
    errorColor: errorColor,
  );
}

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.notoSansTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      headline1: headline1,
      button: buttonTextStyle,
    ),
    accentColor: accentColor,
    errorColor: errorColor,
  );
}

class AppTheme extends StateNotifier<ThemeMode> {
  final ThemeRepositoryBase _repository;
  static const _defaultTheme = ThemeMode.light;

  AppTheme(this._repository) : super(ThemeMode.light);

  Future<ThemeMode> themeMode() async {
    if (state == null) {
      state = await _repository.loadThemeMode() ?? _defaultTheme;
    }
    return state;
  }

  Future<void> _loadLightMode() async {
    state = ThemeMode.light;
    await _repository.saveThemeMode(state);
  }

  Future<void> _loadDarkMode() async {
    state = ThemeMode.dark;
    await _repository.saveThemeMode(state);
  }

  Future<void> toggle() async {
    state == ThemeMode.light ? await _loadDarkMode() : await _loadLightMode();
  }
}
