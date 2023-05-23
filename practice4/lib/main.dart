import 'package:flutter/material.dart';
import 'package:practice4/test_page1.dart';
import 'package:practice4/test_page2.dart';
import 'package:practice4/test_page3.dart';
import 'package:practice4/test_page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo'),
        '/test1': (context) => const TestPage1(),
        '/test2': (context) => const TestPage2(),
        '/test3/second': (context) => const TestPage3('Second'),
        '/test3/third': (context) => const TestPage3('Third'),
        '/test4': (context) => const TestPage4(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _bottomTabMessage = 'you tapped: ???';
  static var _listMessage = 'you tapped: ???';
  static var _drawerMessage = 'you tapped: ???';
  static var _tabIndex = 0;
  static var _listIndex = 0;
  static var _tapped = 0;
  static var _items = <Widget>[];

  void tapBottomIcon(int value) {
    var items = ['Android', 'Heart', 'Home'];

    setState(() {
      _tabIndex = value;
      _bottomTabMessage = 'you tapped: "${items[_tabIndex]}"';
    });
  }

  void tapTile() {
    setState(() {
      _listMessage = 'you tapped: No. $_listIndex';
    });
  }

  void tapItem() {
    Navigator.pop(context);

    setState(() {
      _drawerMessage = 'you tapped: [$_tapped]';
    });
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: () {
          _tapped = i;
          tapItem();
        },
      );

      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed("/test1"),
            },
            child: const Text('進む'),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: _items,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(
            _bottomTabMessage,
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            _listMessage,
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            _drawerMessage,
            style: const TextStyle(fontSize: 18.0),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.android,
                  size: 32.0,
                ),
                title: const Text(
                  'First Item',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
                selected: _listIndex == 1,
                onTap: () {
                  _listIndex = 1;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  size: 32.0,
                ),
                title: const Text(
                  'Second Item',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
                selected: _listIndex == 2,
                onTap: () {
                  _listIndex = 2;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 32.0,
                ),
                title: const Text(
                  'Third Item',
                  style: TextStyle(
                    fontSize: 28.0,
                  ),
                ),
                selected: _listIndex == 3,
                onTap: () {
                  _listIndex = 3;
                  tapTile();
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        backgroundColor: Colors.lightBlueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Android',
            icon: Icon(
              Icons.android,
              color: Colors.black,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        onTap: tapBottomIcon,
      ),
    );
  }
}
