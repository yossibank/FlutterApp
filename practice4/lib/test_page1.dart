import 'package:flutter/material.dart';
import 'package:practice4/test_page2.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  static var _message = '☆☆☆☆☆';
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
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TestPage2(),
                ),
              ),
            },
            tooltip: 'next push',
            icon: const Icon(Icons.navigate_next),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: Text(
                  'One',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Two',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Three',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Four',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Five',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Six',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: Text(
                  'Seven',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
