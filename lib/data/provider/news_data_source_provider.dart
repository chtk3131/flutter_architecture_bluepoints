import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../remote/news_data_source.dart';
import '../remote/news_data_source_base.dart';

import './dio_provider.dart';

final newsDataSourceProvider = Provider<NewsDataSourceBase>((ref) {
  return NewsDataSource(dio: ref.read(dioProvider));
});
