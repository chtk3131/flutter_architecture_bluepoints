import 'package:architecture_bluepoints/data/repository/theme_repository.dart';
import 'package:architecture_bluepoints/data/repository/theme_repository_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './theme_data_source_provider.dart';

final themeRepositoryProvider = Provider<ThemeRepositoryBase>((ref) {
  return ThemeRepository(dataSource: ref.read(themeDataSourceProvider));
});
