import 'package:flutter/material.dart';

import './news_repository_base.dart';
import '../model/news.dart';
import '../model/result.dart';

class NewsRepository extends NewsRepositoryBase {
  @override
  Future<Result<News>> getNews() {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
