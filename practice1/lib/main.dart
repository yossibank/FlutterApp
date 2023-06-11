import 'package:flutter/material.dart';
import 'package:practice1/chapter.dart';
import 'package:practice1/chapter1.dart';
import 'package:practice1/chapter2_1.dart';
import 'package:practice1/chapter2_2.dart';
import 'package:practice1/chapter2_3.dart';
import 'package:practice1/chapter2_4.dart';
import 'package:practice1/chapter2_5.dart';
import 'package:practice1/chapter2_6.dart';
import 'package:practice1/chapter2_7.dart';
import 'package:practice1/chapter2_8.dart';
import 'package:practice1/chapter2_9.dart';

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
        '/': (context) => const ChapterPage(),
        '/chapter1': (context) => const Chapter1Page(),
        '/chapter2-1': (context) => const Chapter2Page1(),
        '/chapter2-2': (context) => const Chapter2Page2(),
        '/chapter2-3': (context) => const Chapter2Page3(),
        '/chapter2-4': (context) => const Chapter2Page4(),
        '/chapter2-5': (context) => const Chapter2Page5(),
        '/chapter2-6': (context) => const Chapter2Page6(),
        '/chapter2-7': (context) => const Chapter2Page7(),
        '/chapter2-8': (context) => const Chapter2Page8(),
        '/chapter2-9': (context) => const Chapter2Page9(),
      },
    );
  }
}
