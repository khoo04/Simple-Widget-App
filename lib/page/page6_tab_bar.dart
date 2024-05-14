import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  //late TabController _tabController;
  final List<Tab> myTabs = const [
    Tab(text: "Page 1"),
    Tab(text: "Page 2"),
    Tab(text: "Page 3"),
  ];

  final List<Widget> _tabView = const [
    Center(child: Text("Page 2")),
    Center(child: Text("Page 1")),
    Center(child: Text("Page 3")),
  ];
  @override
  void initState() {
    // TODO: implement initState
    //_tabController = TabController(length: , vsync: vsync);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tabController = TabController(length: myTabs.length, vsync: this);
    // return DefaultTabController(
    //   length: myTabs.length,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: TabBar(
    //         tabs: myTabs,
    //       ),
    //     ),
    //     body: TabBarView(children: _tabView),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabView,
      ),
    );
  }
}
