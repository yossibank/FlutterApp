import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestPage4 extends StatefulWidget {
  const TestPage4({Key? key}) : super(key: key);

  @override
  State<TestPage4> createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> {
  static ui.Image? _img;
  static bool _flg = false;

  Future<void> loadAssetImage(String fileName) async {
    final bd = await rootBundle.load('assets/images/$fileName');
    final Uint8List u8lst = Uint8List.view(bd.buffer);
    final codec = await ui.instantiateImageCodec(u8lst);
    final frameInfo = await codec.getNextFrame();
    _img = frameInfo.image;

    setState(() {
      _flg = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadAssetImage('image.png');

    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage4'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/test5'),
            },
            icon: const Icon(Icons.navigate_next, size: 32),
          ),
        ],
      ),
      body: CustomPaint(
        painter: Test4Painter(_img),
      ),
    );
  }
}

class Test4Painter extends CustomPainter {
  final ui.Image? _img;

  Test4Painter(this._img);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    final img = _img;

    if (img != null) {
      Rect r0 = Rect.fromLTWH(0.0, 0.0, img.width.toDouble(), img.height.toDouble());

      Rect r = const Rect.fromLTWH(50.0, 50.0, 100.0, 100.0);
      canvas.drawImageRect(img, r0, r, p);

      r = const Rect.fromLTWH(50.0, 250.0, 200.0, 100.0);
      canvas.drawImageRect(img, r0, r, p);

      r = const Rect.fromLTWH(250.0, 50.0, 100.0, 200.0);
      canvas.drawImageRect(img, r0, r, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
