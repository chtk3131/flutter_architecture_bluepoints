import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import './news_data_source_base.dart';
import '../model/news.dart';
import "../../utils/date_time.dart"

class NewsDataSource extends NewsDataSourceBase {
  final Dio _dio;

  // コンストラクタ
  NewsDataSource({@required Dio dio}) : _dio = dio;

  @override
  Future<News> getNews() {
    return _dio.get<Map<String, dynamic>>("/v2/everything",
        queryParameters: <String, String>{
          "q": ["anim", "manga"][Random().nextInt(2)],
          "from": DateTime.now().subtract(
            const Duration(days: 28),
          ).toLocal().formatYYYYMMdd(),
        });
  }
}
