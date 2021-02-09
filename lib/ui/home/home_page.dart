import 'package:architecture_bluepoints/utils/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import './home_view_model.dart';
import '../app_theme.dart';

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);
    final theme = useProvider(appThemeNotifierProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.color_lens,
            ),
            onPressed: () async {
              await appTheme.toggle().catchError((onError) {
                showErrorSnackbar(
                  "テーマ変更時のエラー",
                  "テーマ変更時にエラーが発生しました",
                );
              });
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
