import 'package:flutter/material.dart';
import 'package:practice3/test_page1.dart';
import 'package:practice3/test_page2.dart';
import 'package:practice3/test_page3.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidgetで静的なWidgetを返す
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final title = 'Flutterタイトル';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: title),
      routes: {
        "/test1": (BuildContext context) => const TestPage1(title: "test1"),
        "/test2": (BuildContext context) => const TestPage2(title: "test2"),
        "/test3": (BuildContext context) => const TestPage3(),
      },
    );
  }
}

// StatefulWidgetで動的なWidgetを生成する。実際の状態管理はcreateState()で作成する
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Data {
  final int _price;
  final String _name;

  Data(this._name, this._price) : super();

  @override
  String toString() {
    return '$_name:$_price円';
  }
}

// StatefulWidgetの状態を管理する。状態に応じて表示するWidgetを返す。
class _MyHomePageState extends State<MyHomePage> {
  static final _data = [
    Data('Apple', 200),
    Data('Orange', 150),
    Data('Peach', 300),
  ];

  Data _item = (_data..shuffle()).first;

  void _setData() {
    setState(() {
      _item = (_data..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set data'),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed("/test1"),
            },
            child: const Text(
              "進む",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'One',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Two',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Three',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            _item.toString(),
            style: const TextStyle(fontSize: 32.0),
          ),
          Text(
            _item.toString(),
            style: const TextStyle(fontSize: 32.0),
          ),
          Text(
            _item.toString(),
            style: const TextStyle(fontSize: 32.0),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        tooltip: 'SetData',
        child: const Icon(Icons.star),
      ),
    );
  }
}
