import '../model/news.dart';
import '../model/result.dart';

abstract class NewsRepositoryBase {
  Future<Result<News>> getNews();
}