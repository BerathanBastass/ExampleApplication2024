import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/favorites/favorites.dart';
import 'package:examplaapplication2024/feature/homepage/homepage.dart';
import 'package:examplaapplication2024/feature/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;
  final List _pages = [
    MaterialApp(
      home: Profil(),
      debugShowCheckedModeBanner: false,
    ),
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
    const MaterialApp(
      home: Favorites(),
      debugShowCheckedModeBanner: false,
    )
  ];
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CustomColors.pageColor,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.houseUser,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart), label: "Favorites"),
        ],
      ),
    );
  }
}
