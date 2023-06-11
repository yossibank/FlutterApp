import 'package:flutter/material.dart';
import 'package:practice1/chapter1.dart';

// エントリーポイントのmain関数
void main() {
  // MyAppの呼び出し
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // タイトルとテーマの設定。画面の本体はChapter1()で作成する
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Chapter1(),
    );
  }
}
