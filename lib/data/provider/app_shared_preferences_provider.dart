import 'package:architecture_bluepoints/data/local/app_shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSharedPreferencesProvider = Provider<AppSharedPreferences>((_) {
  return AppSharedPreferences();
});
