import 'package:flutter/material.dart';

class TestPage9 extends StatefulWidget {
  const TestPage9({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage9State();
}

class _TestPage9State extends State<TestPage9> {
  bool _flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage9'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedAlign(
              alignment: _flg ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            AnimatedCrossFade(
              firstChild: const FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 100,
              ),
              secondChild: const FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 100,
              ),
              crossFadeState: _flg ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: _flg ? 24 : 48,
                fontWeight: FontWeight.bold,
                color: _flg ? Colors.red : Colors.blue,
              ),
              duration: const Duration(seconds: 1),
              child: const Text('Hello Flutter!'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: _flg ? Colors.red : Colors.blue,
              width: _flg ? 100 : 200,
              height: _flg ? 200 : 100,
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
