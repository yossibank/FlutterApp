import 'package:flutter/material.dart';
import 'package:practice2/test_page1.dart';
import 'package:practice2/test_page2.dart';
import 'package:practice2/test_page3.dart';

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
        "/test1": (BuildContext context) => const TestPage1(),
        "/test2": (BuildContext context) => const TestPage2(),
        "/test3": (BuildContext context) => const TestPage3(),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool _flag = false;
  int _selectedIndex = 0;

  late PageController _pageController;

  final _pages = [
    const TestPage1(),
    const TestPage2(),
    const TestPage3(),
  ];

  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  late Animation<Color?> _animationColor;

  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  final ColorTween _tweenColor = ColorTween(begin: Colors.green, end: Colors.blue);

  // ボタンタップ時にフラグを切り替える
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

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

    _pageController = PageController(initialPage: _selectedIndex);
  }

  // 破棄
  @override
  void dispose() {
    _animationController.dispose();
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
        children: _pages,
      ),
      // body: TestPage1(),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         "AnimationController:${_animationController.value}",
      //         style: const TextStyle(fontSize: 10)
      //       ),
      //       Text(
      //         "AnimationDouble:${_animationDouble.value}",
      //         style: const TextStyle(fontSize: 10)
      //       ),
      //       Text(
      //         "AnimationColor:${_animationColor.value}",
      //         style: const TextStyle(fontSize: 10)
      //       ),
      //       SizeTransition(
      //         sizeFactor: _animationController,
      //         child: Center(
      //           child: SizedBox(
      //             width: _animationDouble.value,
      //             height: _animationDouble.value,
      //             child: Container(color: _animationColor.value)
      //           )
      //         ),
      //       )
            // AnimatedOpacity(
            //   opacity: _flag ? 0.1 : 1.0,
            //   duration: const Duration(seconds: 3),
            //   child: Text(
            //     "消える文字",
            //     style: Theme.of(context).textTheme.headlineMedium,
            //   )
            // ),
            // AnimatedSize(
            //   duration: const Duration(seconds: 3),
            //   child: SizedBox(
            //     width: _flag ? 50 : 100,
            //     height: _flag ? 50 : 100,
            //     child: Container(color: Colors.purple),
            //   )
            // ),
            // AnimatedAlign(
            //   duration: const Duration(seconds: 3),
            //   alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
            //   child: SizedBox(
            //     width: 50,
            //     height: 50,
            //     child: Container(color: Colors.green),
            //   )
            // ),
            // AnimatedContainer(
            //   duration: const Duration(seconds: 3),
            //   width: _flag ? 100 : 50,
            //   height: _flag ? 50 : 100,
            //   padding: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   margin: _flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
            //   transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
            //   color: _flag ? Colors.blue : Colors.grey,
            // ),
            // AnimatedSwitcher(
            //   duration: const Duration(seconds: 3),
            //   child: _flag
            //     ? const Text("なにもない")
            //     : const Icon(Icons.favorite, color: Colors.pink),
            // ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: _forward,
      //       child: const Icon(Icons.arrow_forward),
      //     ),
      //     FloatingActionButton(
      //       onPressed: _stop,
      //       child: const Icon(Icons.pause),
      //     ),
      //     FloatingActionButton(
      //       onPressed: _reverse,
      //       child: const Icon(Icons.arrow_back),
      //     )
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _click,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
