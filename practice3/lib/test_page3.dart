import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key}) : super(key: key);

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  static var _dropdownMessage = 'select: $_selected';
  static var _selected = 'One';
  static var _sliderMessage = 'slider value $_value';
  static var _value = 0.0;
  static var _alertMessage = 'Alert';
  static var _simpleAlertMessage = 'Simple Alert';

  void popupSelected(String? value) {
    setState(() {
      _selected = value ?? 'not selected...';
      _dropdownMessage = 'select: $_selected';
    });
  }

  void sliderChanged(double value) {
    setState(() {
      _value = value.floorToDouble();
      _sliderMessage = 'slider value: $_value';
    });
  }

  void buttonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Hello!'),
        content: const Text('This is sample'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop<String>(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop<String>(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ).then<void>((value) => resultAlert(value));
  }

  void simpleButtonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('Select assignment'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'One'),
            child: const Text('One'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'Two'),
            child: const Text('Two'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'Three'),
            child: const Text('Three'),
          ),
        ],
      ),
    ).then<void>((value) => simpleResultAlert(value));
  }

  void resultAlert(String value) {
    setState(() {
      _alertMessage = 'Alert $value';
    });
  }

  void simpleResultAlert(String value) {
    setState(() {
      _simpleAlertMessage = 'Simple Alert $value';
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton<String>(
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: PopupMenuButton(
                  onSelected: (String value) => popupSelected(value),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      value: 'One',
                      child: Text('One'),
                    ),
                    const PopupMenuItem(
                      value: 'Two',
                      child: Text('Two'),
                    ),
                    const PopupMenuItem(
                      value: 'Three',
                      child: Text('Three'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _sliderMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Slider(
                onChanged: sliderChanged,
                min: 0.0,
                max: 100.0,
                divisions: 20,
                value: _value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _alertMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: buttonPressed,
                  child: const Text(
                    'Show Dialog!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _simpleAlertMessage,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: simpleButtonPressed,
                  child: const Text(
                    'Show Simple Dialog!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
