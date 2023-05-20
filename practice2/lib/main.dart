import 'package:flutter/material.dart';
import 'package:practice2/test_page1.dart';
import 'package:practice2/test_page2.dart';
import 'package:practice2/test_page3.dart';
import 'package:practice2/test_page4.dart';
import 'package:practice2/test_page5.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/test1": (BuildContext context) => const TestPage1(title: "test1"),
        "/test2": (BuildContext context) => const TestPage2(title: "test2"),
        "/test3": (BuildContext context) => const TestPage3(title: "test3"),
        "/test4": (BuildContext context) => const TestPage4(title: "test4"),
        "/test5": (BuildContext context) => const TestPage5(title: "test5"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  late PageController _pageController;

  final _pages = [
    const TestPage1(title: "test1"),
    const TestPage2(title: "test2"),
    const TestPage3(title: "test3"),
    const TestPage4(title: "test4"),
    const TestPage5(title: "test5"),
  ];

  // 生成
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  // 破棄
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages
      )
    );
  }
}
