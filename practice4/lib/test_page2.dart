import 'package:flutter/material.dart';
import 'package:practice4/test_page3.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  static final _controller = TextEditingController();
  static var _input = '';

  void changeField(String val) {
    _input = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test2'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushNamed(context, '/test3/second'),
            },
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Text(
            'Home Screen',
            style: TextStyle(fontSize: 32.0),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 28.0),
              onChanged: changeField,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, size: 32.0),
          ),
          BottomNavigationBarItem(
            label: 'Next',
            icon: Icon(Icons.navigate_next, size: 32.0),
          ),
        ],
        onTap: (int value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestPage3(_input),
              ),
            );
          }
        },
      ),
    );
  }
}
