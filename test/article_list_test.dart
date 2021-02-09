import 'package:architecture_bluepoints/model/article.dart';
import 'package:architecture_bluepoints/model/article_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ArticleList articleListForText;

  setUp(() {
    // ダミーデータ
    articleListForText = ArticleList(<Article>[
      Article(
          title: "sample1",
          lastUpdated: DateTime(2020, 1, 1),
          isLiked: false,
          likeCount: 10),
      Article(
          title: "sample2",
          lastUpdated: DateTime(2020, 1, 2),
          isLiked: false,
          likeCount: 20),
      Article(
          title: "sample3",
          lastUpdated: DateTime(2020, 1, 3),
          isLiked: false,
          likeCount: 30),
      Article(
          title: "sample4",
          lastUpdated: DateTime(2020, 1, 4),
          isLiked: false,
          likeCount: 40),
      Article(
          title: "sample5",
          lastUpdated: DateTime(2020, 1, 5),
          isLiked: false,
          likeCount: 50),
    ]);
  });

  group("dataSource test", () {
    test("データ数：５", () {
      expect(articleListForText.dataSource.length, 5);
    });

    test("1つデータを追加したら、合計６個になる", () {
      articleListForText.add(
        Article(
          title: "sample6",
          lastUpdated: DateTime(2020, 1, 6),
          isLiked: false,
          likeCount: 60,
        ),
      );
      expect(articleListForText.dataSource.length, 6);
    });

    test("先頭のデータはsample1である", () {
      expect(articleListForText.dataSource.first.title, "sample1");
    });

    test("末尾のデータはsample5である", () {
      expect(articleListForText.dataSource.last.title, "sample5");
    });

    test("全いいね数は１５０である", () {
      expect(articleListForText.totalLikeCount, 150);
    });
  });
}
