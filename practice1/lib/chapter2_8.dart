import 'package:flutter/material.dart';

class Chapter2Page8 extends StatelessWidget {
  const Chapter2Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter2-8'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const TestPage1();
                },
              ),
            ),
          },
          child: const Text(
            '進む',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}

class TestPage1 extends StatelessWidget {
  const TestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const TestPage2();
                    },
                  ),
                ),
              },
              child: const Text(
                '進む',
                style: TextStyle(fontSize: 80),
              ),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
              },
              child: const Text(
                '戻る',
                style: TextStyle(fontSize: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestPage2 extends StatelessWidget {
  const TestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test2'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.of(context).pop(),
          },
          child: const Text(
            '戻る',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
