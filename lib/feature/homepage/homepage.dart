import 'package:examplaapplication2024/core/function/local/appbar.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/mixed_screen.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBarWithTabBar(
          title: "Products",
          tabBar: const [
            Tab(text: 'Mixed'),
            Tab(text: 'Female'),
            Tab(text: 'Kids'),
            Tab(text: 'Electronic'),
          ],
        ),
        body: TabBarView(
          controller: TabController(length: 4, vsync: Scaffold.of(context)),
          children: [
            MixedScreen(),
            Center(child: Text('Tab 3 İçeriği')),
            Center(child: Text('Tab 3 İçeriği')),
            Center(child: Text('')),
          ],
        ),
      ),
    );
  }
}
