import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  static var _textMessage = 'Message';
  static var _checked = false;
  static var _checkedMessage = 'Check';
  static var _selected = 'A';
  static var _selectedMessage = 'Radio';
  static final _controller = TextEditingController();

  void buttonPressed() {
    setState(() {
      _textMessage = 'you said: ${_controller.text}';
    });
  }

  void textChanged(String val) {
    setState(() {
      _textMessage = val.toUpperCase();
    });
  }

  void checkChanged(bool? value) {
    setState(() {
      _checked = value!;
      _checkedMessage = value ? 'checked!' : 'not checked...';
    });
  }

  void radioCheckChanged(String? value) {
    setState(() {
      _selected = value ?? 'no data';
      _selectedMessage = 'select: $_selected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _textMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                onChanged: textChanged,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: buttonPressed,
                child: const Text(
                  "Push me!",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _checkedMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: _checked,
                    onChanged: checkChanged,
                  ),
                  const Text(
                    'Checkbox',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Switch(
                    value: _checked,
                    onChanged: checkChanged,
                  ),
                  const Text(
                    'Switch',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _selectedMessage,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Radio<String>(
                  value: 'A',
                  groupValue: _selected,
                  onChanged: radioCheckChanged,
                ),
                const Text(
                  'radio A',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Radio<String>(
                  value: 'B',
                  groupValue: _selected,
                  onChanged: radioCheckChanged,
                ),
                const Text(
                  'radio B',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
