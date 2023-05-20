import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppの呼び出し
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. タイトルとテーマの設定。画面の本体はMyHomePageで作成する
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// stateful・・・状態を持つ。動的で変化する。状態によって同じ入力でも出力が変わることがある。
// stateless・・・状態を持たない。静的で変化しない。どんな時でも同じ入力に対して同じ出力になる。

// StatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // _MyHomePageStateを利用する
  State<MyHomePage> createState() => _MyHomePageState();
}

// State
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";

  // 5. カウンタが押された時のメソッド
  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        _type = "偶数";
      } else {
        _type = "奇数";
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MyHomePageの画面を構築する部分
    return Scaffold(
      // 画面上部のタイトル部分
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(children: [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      body: Column(
        children: [
          Text("$_counter"),
          Text(
            _type,
            style: const TextStyle(fontSize: 20.0, color: Colors.red),
          ),
          if (_counter % 2 == 0)
          const Text(
            "偶数！！！",
            style: TextStyle(fontSize: 20.0, color: Colors.grey),
          ),
          TextButton(
            onPressed: _resetCounter,
            child: const Text("リセット"),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 16)),
          const Icon(
            FontAwesomeIcons.gift,
            color: Colors.teal,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
            onPressed: () async {
              Uri url = Uri.parse("https://google.com");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const Icon(FontAwesomeIcons.airbnb),
          )),
        ]
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text("EndDrawer"),
        ),
      ),
    );
  }
}

// どんなWidgetがあるのかの紹介動画
// [https://www.youtube.com/watch?v=1wBpX0iFl5E&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG]

// どんなパッケージがあるのかのリポジトリ
// [https://pub.dev/]