import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Chapter2Page1 extends StatefulWidget {
  const Chapter2Page1({super.key});

  @override
  State<Chapter2Page1> createState() => _Chapter2Page1State();
}

class _Chapter2Page1State extends State<Chapter2Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.create),
            Text('Chapter2-1'),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text('Hello World!'),
          const Text('ハローワールド'),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('戻る'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36,
              ),
              Icon(
                FontAwesomeIcons.gift,
                color: Colors.teal,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('ボタンタップ2'),
        child: const Icon(Icons.timer),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('EndDrawer'),
        ),
      ),
    );
  }
}
