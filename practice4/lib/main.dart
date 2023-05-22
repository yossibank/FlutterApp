import 'package:flutter/material.dart';
import 'package:practice4/test_page1.dart';

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
      routes: {
        "/test1": (BuildContext context) => const TestPage1(),
      },
      home: const MyHomePage(title: 'Flutter Demo'),
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
  static var _tabMessage = 'you tapped: ???';
  static var _listMessage = 'you tapped: ???';
  static var _tabIndex = 0;
  static var _listIndex = 0;

  void tapBottomIcon(int value) {
    var items = ['Android', 'Heart', 'Home'];

    setState(() {
      _tabIndex = value;
      _tabMessage = 'you tapped: "${items[_tabIndex]}"';
    });
  }

  void tapTile() {
    setState(() {
      _listMessage = 'you tapped: No. $_listIndex';
    });
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
      body: Column(
        children: <Widget>[
          Text(
            _tabMessage,
            style: const TextStyle(fontSize: 18.0),
          ),
          Text(
            _listMessage,
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
