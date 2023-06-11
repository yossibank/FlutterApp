import 'package:flutter/material.dart';

class Chapter2Page9 extends StatefulWidget {
  const Chapter2Page9({super.key});

  @override
  State<Chapter2Page9> createState() => _Chapter2Page9State();
}

class _Chapter2Page9State extends State<Chapter2Page9> {
  late PageController _pageController;

  int _selectedIndex = 0;

  final _pages = [
    const TestPage3(),
    const TestPage4(),
    const TestPage5(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}

class TestPage3 extends StatelessWidget {
  const TestPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test3'),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: const Text(
            'Test3',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}

class TestPage4 extends StatelessWidget {
  const TestPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test4'),
      ),
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: const Text(
            'Test4',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}

class TestPage5 extends StatelessWidget {
  const TestPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test5'),
      ),
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          child: const Text(
            'Test5',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
