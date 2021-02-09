import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import "package:flutter/foundation.dart";
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../constants.dart';

// 全体的によくわからん
class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions options]) {
    options = BaseOptions(
      baseUrl: Constants.of().endpoint,
      contentType: "application/json",
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;

    interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      options.headers.addAll(await userAgentClientHintsHeader());
    }));

    // API cache
    interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: Constants.of().endpoint,
        ),
      ).interceptor,
    );

    // Firebase用のやつい

    if (kDebugMode) {
      // Local log
      interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
