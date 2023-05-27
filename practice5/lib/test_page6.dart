import 'package:flutter/material.dart';

class TestPage6 extends StatefulWidget {
  const TestPage6({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage6State();
}

class _TestPage6State extends State<TestPage6> {
  static final List<Offset> _points = [];
  static double _value = 0;
  static double _opaq = 0;

  void _addPoint(PointerDownEvent event) {
    setState(() {
      _points.add(event.localPosition);
    });
  }

  void _changeVal(double value) {
    setState(() {
      _value = value;
    });
  }

  void _changeOpaq(double value) {
    setState(() {
      _opaq = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage6'),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: Test6Painter(_value, _opaq.toInt()),
              child: const Center(),
            ),
          ),
          Slider(
            min: 0.0,
            max: 300.0,
            value: _value,
            onChanged: _changeVal,
          ),
          Slider(
            min: 0.0,
            max: 255.0,
            value: _opaq,
            onChanged: _changeOpaq,
          ),
        ],
      ),
    );
  }
}

class Test6Painter extends CustomPainter {
  final double _value;
  final int _opaq;

  Test6Painter(this._value, this._opaq);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(_opaq, 0, 200, 100);

    Rect r = Rect.fromLTWH((size.width - _value) / 2, (size.height - _value) / 2, _value, _value);
    canvas.drawOval(r, p);

    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
