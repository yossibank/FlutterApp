import 'package:flutter/material.dart';

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
    // 3. タイトルとテーマの設定。画面の本体はMyHomePageで作成
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 5. カウンタが押された時のメソッド
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("HelloWorld");
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
          const Text("HelloWorld"),
          const Text("ハローワールド"),
          TextButton(
            onPressed: () => { print("ボタンが押されたよ") },
            child: const Text("テキストボタン"),
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
        ]
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () => { print("押したね？") },
        child: const Icon(Icons.timer),
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