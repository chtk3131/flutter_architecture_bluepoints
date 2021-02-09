import 'package:architecture_bluepoints/ui/components/article_item.dart';
import 'package:architecture_bluepoints/ui/components/container_with_loading.dart';
import 'package:architecture_bluepoints/ui/loading_state_view_model.dart';
import 'package:architecture_bluepoints/utils/error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import './home_view_model.dart';
import '../app_theme.dart';
import '../../utils/ext/async_snapshot.dart';

class HomePage extends HookWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);

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
      body: ContainerWithLoading(
        child: HookBuilder(
          builder: (context) {
            final homeViewModel = useProvider(homeViewProvider);
            final news = useProvider(homeViewProvider.state);

            final snapShot = useFuture(useMemoized(() {
              return context
                  .read(loadingStateProvider)
                  .whileLoading(homeViewModel.fetchNews);
            }, [news.toString()]));

            if (!snapShot.isDone) return Container();

            return news.when(success: (data) {
              if (data.articles.isEmpty) {
                return const Text(
                  "Empty screen",
                );
              }

              return RefreshIndicator(
                child: ListView.builder(itemBuilder: (_, index) {
                  return ArticleItem(data.articles[index]);
                }),
                onRefresh: () async => await homeViewModel.fetchNews(),
              );
            }, failure: (e) {
              return Text("Error Screen: $e");
            });
          },
        ),
      ),
    );
  }
}
