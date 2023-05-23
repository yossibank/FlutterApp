import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  final String _value;

  const TestPage3(this._value, {super.key});

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test3'),
      ),
      body: Center(
        child: Text(
          'you typed:${widget._value}',
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Prev',
            icon: Icon(
              Icons.navigate_before,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '?',
            icon: Icon(
              Icons.android,
              size: 32.0,
            ),
          ),
        ],
        onTap: (int value) {
          if (value == 0) {
            Navigator.pop(context);
          }

          if (value == 1) {
            Navigator.of(context).pushNamed('/test3/third');
          }
        },
      ),
    );
  }
}
