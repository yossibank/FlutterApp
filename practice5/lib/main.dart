import 'package:flutter/material.dart';
import 'package:practice5/test_page1.dart';
import 'package:practice5/test_page2.dart';
import 'package:practice5/test_page3.dart';
import 'package:practice5/test_page4.dart';
import 'package:practice5/test_page5.dart';
import 'package:practice5/test_page6.dart';
import 'package:practice5/test_page7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Home'),
        '/test1': (context) => const TestPage1(),
        '/test2': (context) => const TestPage2(),
        '/test3': (context) => const TestPage3(),
        '/test4': (context) => const TestPage4(),
        '/test5': (context) => const TestPage5(),
        '/test6': (context) => const TestPage6(),
        '/test7': (context) => const TestPage7(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/test7'),
            },
            icon: const Icon(Icons.navigate_next, size: 32),
          ),
        ],
      ),
      body: CustomPaint(
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(150, 0, 200, 255);
    Rect r = const Rect.fromLTWH(50.0, 50.0, 150.0, 150.0);
    canvas.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    r = const Rect.fromLTWH(100.0, 100.0, 150.0, 150.0);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
