import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage2'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/test3'),
            },
            icon: const Icon(Icons.navigate_next, size: 32),
          )
        ],
      ),
      body: CustomPaint(
        painter: Test2Painter(),
      ),
    );
  }
}

class Test2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.stroke;
    p.strokeWidth = 5.0;
    p.color = const Color.fromARGB(150, 0, 200, 255);

    for (var i = 0; i <= 10; i++) {
      Rect r = Rect.fromLTRB(
        50.0 + 20 * i,
        50.0,
        50.0,
        250 - 20.0 * i,
      );

      canvas.drawLine(r.topLeft, r.bottomRight, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
