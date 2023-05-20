import 'package:flutter/material.dart';
import 'package:practice2/test_page5.dart';

class TestPage4 extends StatefulWidget {
  const TestPage4({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage4> createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> with TickerProviderStateMixin {
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

  // 生成
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
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
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop()
            },
            child: const Text("戻る")
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const TestPage5(title: "test5");
              }))
            },
            child: const Text("進む")
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "AnimationController:${_animationController.value}",
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              "AnimationDouble:${_animationDouble.value}",
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              "AnimationColor:${_animationColor.value}",
              style: const TextStyle(fontSize: 10),
            ),
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: SizedBox(
                  width: _animationDouble.value,
                  height: _animationDouble.value,
                  child: Container(color: _animationColor.value),
                ),
              ),
            )
          ],
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _forward,
            heroTag: "forward",
            child: const Icon(Icons.arrow_forward)
          ),
          FloatingActionButton(
            onPressed: _stop,
            heroTag: "stop",
            child: const Icon(Icons.pause)
          ),
          FloatingActionButton(
            onPressed: _reverse,
            heroTag: "reverse",
            child: const Icon(Icons.arrow_back)
          ),
        ],
      ),
    );
  }
}