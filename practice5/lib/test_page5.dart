import 'dart:math';

import 'package:flutter/material.dart';

class TestPage5 extends StatefulWidget {
  const TestPage5({Key? key}) : super(key: key);

  @override
  State<TestPage5> createState() => _TestPage5State();
}

class _TestPage5State extends State<TestPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage5'),
      ),
      body: CustomPaint(
        painter: Test5Painter(),
      ),
    );
  }
}

class Test5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Rect r = const Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);

    r = const Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);

    r = const Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    canvas.save();

    Paint p = Paint();
    p.color = const Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);

    canvas.translate(0.0, 100.0);
    p.color = const Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path, p);

    p.color = const Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-500.0, 50.0);
    canvas.scale(1 * 1.5);
    canvas.drawPath(path, p);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
