import '../model/news.dart';

abstract class NewsDataSourceBase {
  Future<News> getNews();
}
