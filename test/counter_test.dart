import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart' as TEST;
import "package:architecture_bluepoints/counter.dart";

void main() {
  TEST.group("Counter", () {
    TEST.test("起動時は0", () {
      final counter = Counter();

      expect(counter.value, 0);
    });
    TEST.test("incrementしたら１増加", () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    TEST.test("decrementしたら１減少", () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });

    TEST.test("適当に失敗パターン", () {
      final counter = Counter();

      expect(counter.value, -1);
    });
  });
}
