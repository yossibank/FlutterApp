import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  static var _message = 'じゃんけん結果';
  static final _janken = <String>['グー', 'チョキ', 'パー'];

  void buttonPressed() {
    setState(() {
      _message = (_janken..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _message,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            TextButton(
              onPressed: buttonPressed,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.android, size: 50),
              ),
            ),
            ElevatedButton(
              onPressed: buttonPressed,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.apple, size: 50),
              ),
            ),
            IconButton(
              onPressed: buttonPressed,
              icon: const Icon(Icons.insert_emoticon),
              iconSize: 50.0,
              color: Colors.green,
            ),
            RawMaterialButton(
              onPressed: buttonPressed,
              padding: const EdgeInsets.all(10.0),
              elevation: 10.0,
              fillColor: Colors.white,
              child: const Text(
                "Push me!",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
