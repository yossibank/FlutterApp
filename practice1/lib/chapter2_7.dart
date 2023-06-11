import 'package:flutter/material.dart';
import 'dart:math';

class Chapter2Page7 extends StatefulWidget {
  const Chapter2Page7({super.key});

  @override
  State<Chapter2Page7> createState() => _Chapter2Page7State();
}

class _Chapter2Page7State extends State<Chapter2Page7> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  // 停止
  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  // 逆再生
  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = _animationController.drive(
      Tween(
        begin: 0.0,
        end: 2.0 * pi,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter2-7'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Transform.rotate(
              angle: _animation.value,
              child: const Icon(
                Icons.cached,
                size: 100,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _forward,
            child: const Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            child: const Icon(Icons.stop),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            child: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
