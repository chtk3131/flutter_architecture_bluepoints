import 'package:architecture_bluepoints/data/remote/news_data_source.dart';
import 'package:flutter/material.dart';

import './news_repository_base.dart';
import '../model/news.dart';
import '../model/result.dart';

class NewsRepository extends NewsRepositoryBase {
  final NewsDataSource _dataSource;

  NewsRepository({@required NewsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Result<News>> getNews() async {
    return Result.guardFuture(_dataSource.getNews);
  }
}
