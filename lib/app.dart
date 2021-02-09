import 'package:architecture_bluepoints/ui/app_theme.dart';
import 'package:architecture_bluepoints/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';

class App extends HookWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);
    final theme = useProvider(appThemeNotifierProvider.state);

    return GetMaterialApp(
      title: "Flutter Architecture Bluepoints",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme ?? ThemeMode.light,
      home: HomePage(),
      routes: {
        Constants.pageHome: (context) => HomePage(),
      },
    );
  }
}
