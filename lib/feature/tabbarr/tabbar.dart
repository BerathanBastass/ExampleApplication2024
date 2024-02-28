import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/ui/view/electronic_screen.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/female/ui/view/female_screen.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/mixed/ui/view/mixed_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _theme.scaffoldBackgroundColor,
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MixedScreen(),
          FemaleScreen(),
          ElectronicScreen(),
        ],
      ),
    );
  }
}
