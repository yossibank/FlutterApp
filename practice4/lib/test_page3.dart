import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key}) : super(key: key);

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
        child: const Text(
          'Next Screen',
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
        },
      ),
    );
  }
}
