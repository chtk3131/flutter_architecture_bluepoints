import 'package:architecture_bluepoints/model/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import "package:http/http.dart" as http;

// モッククラス
class MockClient extends Mock implements http.Client {}

main() {
  group("fetch test", () {
    test("return success", () async {
      final client = MockClient();

      // どのようなレスポンスがあるかをモック
      // → title:Testが帰ってくるようにした
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async => http.Response('{"title":"Test"}', 200));

      expect(await fetchPost(client), isA<Post>());
    });

    test("return false", () async {
      final client = MockClient();

      // 404で返してみる
      when(client.get("https://jsonplaceholder.typicode.com/posts/1"))
          .thenAnswer((_) async => http.Response("Not Found", 404));

      expect(await fetchPost(client), throwsException);
    });
  });
}
