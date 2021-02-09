import 'package:architecture_bluepoints/data/local/theme_data_source.dart';
import 'package:architecture_bluepoints/data/local/theme_data_source_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './app_shared_preferences_provider.dart';

final themeDataSourceProvider = Provider<ThemeDataSourceBase>((ref) {
  return ThemeDataSource(ref.read(appSharedPreferencesProvider));
});
