import 'dart:math';
import 'package:flutter/material.dart';

class TestPage5 extends StatefulWidget {
  const TestPage5({Key? key}) : super(key: key);

  @override
  State<TestPage5> createState() => _TestPage5State();
}

class _TestPage5State extends State<TestPage5> with TickerProviderStateMixin {
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

  // 生成
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    _animation = _animationController.drive(
      Tween(begin: 0.0, end: 2.0 * pi)
    );
  }

  // 破棄
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test5"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Transform.rotate(
              angle: _animation.value,
              child: const Icon(Icons.cached, size: 100),
            );
          }
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _forward,
            heroTag: "forward",
            child: const Icon(Icons.arrow_forward),
          ),
          FloatingActionButton(
            onPressed: _stop,
            heroTag: "stop",
            child: const Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: _reverse,
            heroTag: "reverse",
            child: const Icon(Icons.arrow_back),
          )
        ]
      )
    );
  }
}