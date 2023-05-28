import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  final _controller = TextEditingController();
  double _r = 0.0;
  double _g = 0.0;
  double _b = 0.0;

  @override
  void initState() {
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage1'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text(
                'PREFERENCE ACCESS',
                style: TextStyle(
                  fontWeight: ui.FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 24),
                minLines: 1,
                maxLines: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              Slider(
                min: 0.0,
                max: 255.0,
                value: _r,
                divisions: 255,
                onChanged: (double value) {
                  setState(() {
                    _r = value;
                  });
                },
              ),
              Slider(
                min: 0.0,
                max: 255.0,
                value: _g,
                divisions: 255,
                onChanged: (double value) {
                  setState(() {
                    _g = value;
                  });
                },
              ),
              Slider(
                min: 0.0,
                max: 255.0,
                value: _b,
                divisions: 255,
                onChanged: (double value) {
                  setState(() {
                    _b = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: 125,
                height: 125,
                color: Color.fromARGB(255, _r.toInt(), _g.toInt(), _b.toInt()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.open_in_new),
        onPressed: () {
          savePref();

          showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                    title: Text('Saved!'),
                    content: Text('Save Preferences.'),
                  ));
        },
      ),
    );
  }

  void loadPref() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _r = (prefs.getDouble('r') ?? 0.0);
      _g = (prefs.getDouble('g') ?? 0.0);
      _b = (prefs.getDouble('b') ?? 0.0);
      _controller.text = (prefs.getString('input') ?? '');
    });
  }

  void savePref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(('r'), _r);
    prefs.setDouble(('g'), _g);
    prefs.setDouble(('b'), _b);
    prefs.setString('input', _controller.text);
  }
}
