import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage3'),
      ),
      body: CustomPaint(
        painter: Test3Painter(),
      ),
    );
  }
}

class Test3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr),
    )
      ..pushStyle(ui.TextStyle(color: Colors.red, fontSize: 48.0))
      ..addText('Hello! ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[700], fontSize: 30.0))
      ..addText('This is a sample of paragraph text.')
      ..pushStyle(ui.TextStyle(color: Colors.blue[200], fontSize: 30.0))
      ..addText('You can draw MULTI-FONT text!');

    ui.Paragraph paragraph = builder.build()..layout(const ui.ParagraphConstraints(width: 300.0));

    Offset off = const Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, off);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
