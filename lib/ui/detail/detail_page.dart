import 'package:architecture_bluepoints/ui/components/network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/article.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ページ遷移時の引数にArticleをセットする感じ？
    final Article article = Get.arguments;

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article.url,
            child: networkImage(article.urlToImage),
          ),
        ),
        onTap: Get.back,
      ),
    );
  }
}
