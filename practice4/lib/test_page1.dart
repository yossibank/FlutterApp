import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  static var _message = 'OK';
  static var _stars = '☆☆☆☆☆';
  static var _star = 0;

  void iconPressedA() {
    _message = 'tap android.';
    _star++;
    update();
  }

  void iconPressedB() {
    _message = 'tap favorite.';
    _star--;
    update();
  }

  void update() {
    _star = _star < 0
        ? 0
        : _star > 5
            ? 5
            : _star;

    setState(() {
      _stars = '★★★★★︎☆☆☆☆☆'.substring(
        5 - _star,
        5 - _star + 6,
      );

      _message = '$_message[$_star]';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('test1'),
        leading: const BackButton(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: iconPressedA,
            tooltip: 'add star...',
            icon: const Icon(Icons.android),
          ),
          IconButton(
            onPressed: iconPressedB,
            tooltip: 'subtract star...',
            icon: const Icon(Icons.favorite),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Center(
            child: Text(
              _stars,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          _message,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
