import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage1'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/test2'),
            },
            icon: const Icon(Icons.navigate_next, size: 32),
          ),
        ],
      ),
      body: CustomPaint(
        painter: Test1Painter(),
      ),
    );
  }
}

class Test1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    // 正円の描画
    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(150, 0, 200, 255);
    Offset ctr = const Offset(100.0, 100.0);
    canvas.drawCircle(ctr, 75.0, p);

    // 楕円1の描画
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    Rect r = const Rect.fromLTWH(100.0, 50.0, 200.0, 150.0);
    canvas.drawOval(r, p);

    // 楕円2の描画
    r = const Rect.fromLTWH(50.0, 100.0, 150.0, 200.0);
    canvas.drawOval(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
