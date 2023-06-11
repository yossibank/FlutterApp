import 'package:flutter/material.dart';

class Chapter2Page6 extends StatefulWidget {
  const Chapter2Page6({super.key});

  @override
  State<Chapter2Page6> createState() => _Chapter2Page6State();
}

class _Chapter2Page6State extends State<Chapter2Page6> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  late Animation<Color?> _animationColor;

  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  final ColorTween _tweenColor = ColorTween(begin: Colors.green, end: Colors.blue);

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
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // TweenとAnimationControllerからAnimationを作る(サイズ)
    _animationDouble = _tweenDouble.animate(_animationController);
    _animationDouble.addListener(() {
      setState(() {});
    });

    // TweenとAnimationControllerからAnimationを作る(色)
    _animationColor = _tweenColor.animate(_animationController);
    _animationColor.addListener(() {
      setState(() {});
    });
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
        title: const Text('Chapter2-6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AnimationController: ${_animationController.value}',
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              'AnimationDouble: ${_animationDouble.value}',
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              'AnimationColor: ${_animationColor.value}',
              style: const TextStyle(fontSize: 10),
            ),
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: SizedBox(
                  width: _animationDouble.value,
                  height: _animationDouble.value,
                  child: Container(
                    color: _animationColor.value,
                  ),
                ),
              ),
            ),
          ],
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
