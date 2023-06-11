import 'package:flutter/material.dart';

class Chapter1Page extends StatefulWidget {
  const Chapter1Page({super.key});

  @override
  State<Chapter1Page> createState() => _Chapter1PageState();
}

class _Chapter1PageState extends State<Chapter1Page> {
  int _counter = 0;

  // カウンタが押された時のメソッド
  void _incrementCounter() {
    setState(() {
      _counter++;
      debugPrint('Hello World');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 画面上部のタイトル部分
      appBar: AppBar(
        title: const Text('Chapter1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 画面中央に表示されるテキスト
            const Text(
              'You have push the button this many times.',
            ),
            // テキストの下に表示されるカウント値
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
