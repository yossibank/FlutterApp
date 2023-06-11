import 'package:flutter/material.dart';
import 'package:practice1/chapter1.dart';
import 'package:practice1/chapter2_1.dart';
import 'package:practice1/chapter2_2.dart';

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
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Chapter1(),
        '/chapter2-1': (context) => const Chapter2Page1(),
        '/chapter2-2': (context) => const Chapter2Page2(),
      },
    );
  }
}
