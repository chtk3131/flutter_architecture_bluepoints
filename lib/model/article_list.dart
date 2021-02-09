import './article.dart';

class ArticleList {
  final List<Article> _list;

  const ArticleList(this._list);

  List<Article> get dataSource {
    _list.sort((first, second) {
      return first.likeCount - second.likeCount;
    });
    return _list;
    // return _list; // TODO: sort by like
  }

  int get totalLikeCount {
    return _list.fold(
        0, (previousValue, element) => previousValue + element.likeCount);
  }

  void add(Article article) {
    _list.add(article);
  }
}
