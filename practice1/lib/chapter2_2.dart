import 'package:flutter/material.dart';

class Chapter2Page2 extends StatefulWidget {
  const Chapter2Page2({super.key});

  @override
  State<Chapter2Page2> createState() => _Chapter2Page2State();
}

class _Chapter2Page2State extends State<Chapter2Page2> {
  int _counter = 0;
  String _type = '偶数';

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter % 2 == 0) {
        _type = '偶数';
      } else {
        _type = '奇数';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter2-2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times.',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _type,
              style: TextStyle(
                fontSize: 20,
                color: (_counter % 2 == 0) ? Colors.red : Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
