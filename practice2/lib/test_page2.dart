import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  bool _flag = false;

  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop()
            },
            child: const Text("戻る")
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed("/test3")
            },
            child: const Text("進む"),
          )
        ],
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
              transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
              color: _flag ? Colors.blue : Colors.grey
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              child: _flag
                ? const Text("なにもない")
                : const Icon(Icons.favorite, color: Colors.pink),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add)
      ),
    );
  }
}