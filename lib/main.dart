import 'package:examplaapplication2024/feature/bottombar/view/bottombar.dart';
import 'package:examplaapplication2024/feature/favorites/view/favorites.dart';
import 'package:examplaapplication2024/feature/tabbarr/tabbar.dart';
import 'package:examplaapplication2024/feature/profile/view/profile.dart';
import 'package:examplaapplication2024/feature/settings/view/settings.dart';

import 'package:examplaapplication2024/feature/tabbar/mixed/ui/mixed_screen.dart';
import 'package:flutter/material.dart';
import 'feature/auth/sıgn_ın/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => const LoginScreen(),
        "/homePage": (context) => const HomePage(),
        "/bottomBar": (context) => const BottomBar(),
        "/favorites": (context) => const Favorites(),
        "/profile": (context) => const Profil(),
        "/midexScreen": (context) => MixedScreen(),
        "/settingsScreen": (context) => const Settings(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
