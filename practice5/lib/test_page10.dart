import 'package:flutter/material.dart';

class TestPage10 extends StatefulWidget {
  const TestPage10({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage10State();
}

class _TestPage10State extends State<TestPage10> {
  bool _flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage10'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: _flg ? 100 : 0,
              left: _flg ? 0 : 100,
              duration: const Duration(seconds: 1),
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _flg = !_flg;
          });
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}
