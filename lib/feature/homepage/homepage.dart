import 'package:examplaapplication2024/core/function/local/appbar.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/favorites/favorites.dart';
import 'package:examplaapplication2024/feature/profile/profile.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/cart/add_to_cart.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/mixed_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.pageColor,
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.bagShopping,
              size: 30,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Mixed'),
            Tab(text: 'Female'),
            Tab(text: 'Kids'),
            Tab(text: 'Electronic'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MixedScreen(),
          AddToCart(),
          Favorites(),
          Profil(),
          // Diğer sayfaları ekleyin
        ],
      ),
    );
  }
}
