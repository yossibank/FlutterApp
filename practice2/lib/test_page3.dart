import 'package:flutter/material.dart';

class TestPage3 extends StatefulWidget {
  const TestPage3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage3> createState() => _TestPage3State();
}

class _TestPage3State extends State<TestPage3> with TickerProviderStateMixin {
  late AnimationController _animationController;

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
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => {
              Navigator.of(context).pop()
            },
            child: const Text("戻る")
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed("/test4")
            },
            child: const Text("進む")
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: Colors.green)
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