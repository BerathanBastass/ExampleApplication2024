import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? tabBar;
  final List<Widget>? actions;
  final List<Widget>? color;
  final List<Widget>? Leading;
  final List<Widget>? titleTextStyle;
  final Widget? icon;

  AppBarScreen({
    required this.title,
    this.actions,
    this.color,
    this.tabBar,
    this.Leading,
    this.icon,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: CustomColors.pageColor,
      actions: actions,
      titleTextStyle: TextStyle(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithTabBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? tabBar;
  final List<Widget>? actions;

  AppBarWithTabBar({required this.title, this.actions, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: CustomColors.pageColor,
      actions: actions,
      bottom: tabBar != null
          ? TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,
              labelStyle: const TextStyle(
                color: Colors.orange,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              controller: TabController(
                  length: tabBar!.length, vsync: Scaffold.of(context)),
              tabs: tabBar!,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (tabBar != null ? kTextTabBarHeight + 16.0 : 0));
}
