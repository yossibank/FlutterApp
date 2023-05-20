import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
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
              Navigator.of(context).pushNamed("/test1")
            },
            child: const Text("進む")
          )
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times:"),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          increment()
        },
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}