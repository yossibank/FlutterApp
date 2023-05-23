import 'package:flutter/material.dart';

class TestPage4 extends StatefulWidget {
  const TestPage4({Key? key}) : super(key: key);

  @override
  State<TestPage4> createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4> with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'One', icon: Icon(Icons.star)),
    Tab(text: 'Two', icon: Icon(Icons.info)),
    Tab(text: 'Three', icon: Icon(Icons.home)),
  ];

  late TabController _tabController;

  Widget createTab(Tab tab) {
    return Center(
      child: Text(
        'This is "${tab.text}" Tab.',
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 32.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test4'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          return createTab(tab);
        }).toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
