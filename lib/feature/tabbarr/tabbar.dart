import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/favorites/view/favorites.dart';
import 'package:examplaapplication2024/feature/profile/view/profile.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.pageColor,
        title: Text(
          "Products",
          style: TextStyle(fontSize: 35),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 35,
            ),
          ),
        ],
        bottom: TabBar(
          labelColor: CustomColors.orangeColor,
          indicatorColor: CustomColors.orangeColor,
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
          const AddCart(),
          const Favorites(),
          const Profil(),
        ],
      ),
    );
  }
}
