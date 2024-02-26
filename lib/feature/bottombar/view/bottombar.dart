import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/tabbarr/tabbar.dart';
import 'package:examplaapplication2024/feature/favorites/view/favorites.dart';
import 'package:examplaapplication2024/feature/profile/view/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:examplaapplication2024/feature/users/view/users_page.dart';
import 'package:examplaapplication2024/feature/settings/view/settings.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomBar> {
  final _pageController = PageController(initialPage: 2);

  final _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const Profil(),
    const Favorites(),
    const HomePage(),
    const Settings(),
    const UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: CustomColors.saltWhite,
              showLabel: false,
              notchColor: const Color(0xFFEE682E),
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.solidUser,
                    color: CustomColors.bottomBarNoActive,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.white,
                  ),
                  itemLabel: 'Profile',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: CustomColors.bottomBarNoActive,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.white,
                  ),
                  itemLabel: 'Favorites',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.house,
                    color: CustomColors.bottomBarNoActive,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.white,
                  ),
                  itemLabel: 'HomePage',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.gear,
                    color: CustomColors.bottomBarNoActive,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.gear,
                    color: Colors.white,
                  ),
                  itemLabel: 'Settings',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.users,
                    color: CustomColors.bottomBarNoActive,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.users,
                    color: Colors.white,
                  ),
                  itemLabel: 'Users',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kBottomRadius: 2,
              kIconSize: 20,
            )
          : null,
    );
  }
}
