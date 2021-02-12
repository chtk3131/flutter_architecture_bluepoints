import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/home/home_page.dart';
import 'ui/detail/detail_page.dart';
import 'constants.dart';
import 'ui/app_theme.dart';

class App extends HookWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(appThemeNotifierProvider.state);

    return GetMaterialApp(
      title: "Flutter Architecture Bluepoints",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme ?? ThemeMode.light,
      routes: {
        "/": (context) => HomePage(),
        Constants.pageHome: (context) => HomePage(),
        Constants.pageDetail: (context) => DetailPage(),
      },
    );
  }
}
