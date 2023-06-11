import 'package:flutter/material.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter1'),
              child: const Text('Chapter1'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-1'),
              child: const Text('Chapter2-1'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-2'),
              child: const Text('Chapter2-2'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-3'),
              child: const Text('Chapter2-3'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-4'),
              child: const Text('Chapter2-4'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-5'),
              child: const Text('Chapter2-5'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-6'),
              child: const Text('Chapter2-6'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-7'),
              child: const Text('Chapter2-7'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-8'),
              child: const Text('Chapter2-8'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/chapter2-9'),
              child: const Text('Chapter2-9'),
            ),
          ],
        ),
      ),
    );
  }
}
