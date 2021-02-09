import 'package:architecture_bluepoints/data/provider/news_data_source_provider.dart';
import 'package:architecture_bluepoints/data/repository/news_repository.dart';
import 'package:architecture_bluepoints/data/repository/news_repository_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './news_data_source_provider.dart';

final newsRepositoryProvider = Provider<NewsRepositoryBase>((ref) {
  return NewsRepository(dataSource: ref.read(newsDataSourceProvider));
});
