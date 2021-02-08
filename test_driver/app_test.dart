import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

void main() {
  group("App Driver Test", () {
    FlutterDriver driver;

    // deviceに接続するのを待つ
    // すべてのテストが始まる前に１度だけ呼ばれる
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // deviceとの接続を切る
    // すべてのテスト終了後に１度だけ呼ばれる
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // スクリーンショットを取る関数
    Future<void> _takeScreenShot(String fileName) async {
      await driver.waitUntilNoTransientCallbacks();

      final pixels = await driver.screenshot();

      final file = File("../test_driver/screenshots/$fileName.png");
      await file.writeAsBytes(pixels);
      print("wrote $file");
    }

    test("起動画面", () async {
      final health = await driver.checkHealth();
      print(health.status);

      await _takeScreenShot("calendar");
    });
  });
}
