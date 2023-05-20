import 'package:flutter_test/flutter_test.dart';

void main() {
  test("mytest1", () {
    int ans = 10;
    expect(10, ans);
  });

  test("mytest2", () {
    int ans = 10;
    expect(ans, 15);
  });

  test("mytest3", () {
    int ans = 0;
    expect(ans, 100);
  }, skip: "一旦スキップ");
}