import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
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
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop()
            },
            child: const Text("戻る")
          ),
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed("/test2")
            },
            icon: const Text("進む")
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _flag ? 0.1 : 1.0,
              duration: const Duration(seconds: 3),
              child: Text(
                "消える文字",
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
            AnimatedSize(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: _flag ? 50 : 200,
                height: _flag ? 50 : 200,
                child: Container(color: Colors.purple),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 3),
              alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Container(color: Colors.green),
              ),
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add),
      ),
    );
  }
}