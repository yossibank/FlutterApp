import 'dart:math';

import 'package:flutter/material.dart';

class TestPage8 extends StatefulWidget {
  const TestPage8({super.key});

  @override
  State<StatefulWidget> createState() => _TestPage8State();
}

class _TestPage8State extends State<TestPage8> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: pi * 2);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = _tweenDouble.animate(controller);
    animation.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage8'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: Test8Painter(animation.value),
                child: const Center(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Test8Painter extends CustomPainter {
  final double value;

  Test8Painter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(100, 255, 0, 255);
    Rect r = const Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);

    canvas.restore();
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = const Color.fromARGB(100, 0, 255, 255);
    r = const Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value * -1);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
