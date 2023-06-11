import 'package:flutter/material.dart';

class Chapter2Page3 extends StatefulWidget {
  const Chapter2Page3({super.key});

  @override
  State<Chapter2Page3> createState() => _Chapter2Page3State();
}

class _Chapter2Page3State extends State<Chapter2Page3> {
  bool _flag = false;

  // ボタンタップ時にフラグ切り替え
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter2-3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _flag ? 0.1 : 1.0,
              duration: const Duration(seconds: 3),
              child: Text(
                '消える文字',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            AnimatedSize(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: _flag ? 50 : 200,
                height: _flag ? 50 : 200,
                child: Container(
                  color: Colors.purple,
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 3),
              alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add),
      ),
    );
  }
}
