import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice6/test_page1.dart';

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
        '/': (context) => GestureDetector(
              onTap: () => primaryFocus?.unfocus(),
              child: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
        '/test1': (context) => GestureDetector(
              onTap: () => primaryFocus?.unfocus(),
              child: const TestPage1(),
            ),
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
  final _controller = TextEditingController();
  final _assetController = TextEditingController();
  final _fileName = 'flutter_sampleData.txt';
  final _documentFileName = 'assets/documents/data.txt';

  Future<File> getDataFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<String> getDataAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void saveIt(String value) async {
    final file = await getDataFile(_fileName);
    file.writeAsString(value);
  }

  Future<String> loadIt() async {
    try {
      final file = await getDataFile(_fileName);
      return file.readAsString();
    } catch (e) {
      return '*** no data ***';
    }
  }

  Future<String> loadAssetIt() async {
    try {
      final res = await getDataAsset(_documentFileName);
      return res;
    } catch (e) {
      return '*** no data ***';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/test1');
            },
            icon: const Icon(Icons.navigate_next, size: 32),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text(
                'FILE ACCESS.',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: ui.FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 24.0),
                minLines: 1,
                maxLength: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(40.0),
              ),
              const Text(
                'RESOURCE ACCESS',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: ui.FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              TextField(
                controller: _assetController,
                style: const TextStyle(fontSize: 24.0),
                minLines: 1,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Save',
            icon: Icon(
              Icons.save,
              color: Colors.white,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Load',
            icon: Icon(
              Icons.open_in_new,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ],
        onTap: (int value) async {
          switch (value) {
            case 0:
              saveIt(_controller.text);

              setState(() {
                _controller.text = '';
              });

              showDialog(
                context: context,
                builder: (BuildContext context) => const AlertDialog(
                  title: Text('Saved!'),
                  content: Text('Save message to file'),
                ),
              );

              break;
            case 1:
              String value = await loadIt();

              setState(() {
                _controller.text = value;
              });

              showDialog(
                context: context,
                builder: (BuildContext context) => const AlertDialog(
                  title: Text('Loaded'),
                  content: Text('Load message from file'),
                ),
              );

              break;
            default:
              if (kDebugMode) {
                print('no default');
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_new),
        onPressed: () async {
          final value = await loadAssetIt();

          setState(() {
            _assetController.text = value;
          });

          showDialog(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
              title: Text("Loaded"),
              content: Text('Loaded message from Asset.'),
            ),
          );
        },
      ),
    );
  }
}
