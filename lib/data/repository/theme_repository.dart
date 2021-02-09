import 'package:architecture_bluepoints/data/local/theme_data_source_base.dart';
import 'package:flutter/material.dart';
import './theme_repository_base.dart';
import '../local/theme_data_source.dart';

class ThemeRepository extends ThemeRepositoryBase {
  final ThemeDataSource _dataSource;
  ThemeRepository({@required ThemeDataSourceBase dataSource})
      : _dataSource = dataSource;

  @override
  Future<ThemeMode> loadThemeMode() {
    return _dataSource.loadThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _dataSource.saveThemeMode(themeMode);
  }
}
