import 'package:flutter_test/flutter_test.dart';

void main() {
  // 成功パターン
  test("myTest1", () {
    int ans = 10;
    expect(ans, 10);
  });

  // 失敗パターン
  test("myTest2", () {
    int ans = 10;
    expect(ans, 15);
  });

  // スキップするパターン
  test("myTest3", () {
    int ans = 0;
    expect(ans, 100);
  }, skip: "一旦スキップ");
}
