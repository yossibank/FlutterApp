import 'package:flutter/material.dart';

class TestPage7 extends StatefulWidget {
  const TestPage7({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage7State();
}

class _TestPage7State extends State<TestPage7> {
  static ValueNotifier<int> _value = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage7'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: Test7Painter(_value),
                child: const Center(),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              onPressed: () => _value.value++,
              child: const Text(
                'Click',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Test7Painter extends CustomPainter {
  final ValueNotifier<int> _value;

  Test7Painter(this._value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(50, 0, 255, 255);

    Rect r;

    for (var i = 0; i < _value.value; i++) {
      r = Rect.fromLTWH(10 + i * 20, 10 + i * 20, 100, 100);

      canvas.drawRect(r, p);
    }

    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);

    if (_value.value > 10) _value.value = 0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
