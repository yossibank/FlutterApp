import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practice2/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 画面を構築する
    await tester.pumpWidget(const MyApp());

    // 0が書かれているWidgetが1つであることをテストする
    expect(find.text('0'), findsOneWidget);
    // 1が書かれているWidgetがないことをテストする
    expect(find.text('1'), findsNothing);

    // アイコンが「+」のWidgetをタップする
    await tester.tap(find.byIcon(Icons.add));
    // Widgetツリーの再構築をする
    await tester.pump();

    // 0が書かれているWidgetがないことをテストする
    expect(find.text('0'), findsNothing);
    // 1が書かれているWidgetが1つであることをテストする
    expect(find.text('1'), findsOneWidget);
  });
}
