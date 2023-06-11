import 'package:flutter/material.dart';

class Chapter2Page4 extends StatefulWidget {
  const Chapter2Page4({super.key});

  @override
  State<Chapter2Page4> createState() => _Chapter2Page4State();
}

class _Chapter2Page4State extends State<Chapter2Page4> {
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
        title: const Text('Chapter2-4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              width: _flag ? 100 : 50,
              height: _flag ? 50 : 100,
              padding: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              margin: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              transform: _flag ? Matrix4.skewX(0) : Matrix4.skewX(0.3),
              color: _flag ? Colors.blue : Colors.grey,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: _flag
                  ? const Text('何もない')
                  : const Icon(
                      Icons.favorite,
                      color: Colors.pink,
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
