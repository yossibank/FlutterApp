import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key}) : super(key: key);

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  static var _dropdownMessage = 'select: $_selected';
  static var _selected = 'One';

  void popupSelected(String? value) {
    setState(() {
      _selected = value ?? 'not selected...';
      _dropdownMessage = 'select: $_selected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _dropdownMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            DropdownButton<String>(
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'One',
                  child: Text('One'),
                ),
                DropdownMenuItem<String>(
                  value: 'Two',
                  child: Text('Two'),
                ),
                DropdownMenuItem<String>(
                  value: 'Three',
                  child: Text('Three'),
                ),
              ],
              onChanged: popupSelected,
              value: _selected,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
