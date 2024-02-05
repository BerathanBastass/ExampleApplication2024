import 'package:examplaapplication2024/feature/bottombar.dart';
import 'package:examplaapplication2024/feature/favorites/favorites.dart';
import 'package:examplaapplication2024/feature/homepage/homepage.dart';
import 'package:examplaapplication2024/feature/profile/profile.dart';
import 'package:flutter/material.dart';
import 'feature/homepage/homepage.dart';
import 'feature/auth/login_screen.dart';

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
        "/loginPage": (context) => LoginScreen(),
        "/homePage": (context) => HomePage(),
        "/bottomBar": (context) => BottomBar(),
        "/favorites": (context) => Favorites(),
        "/profile": (context) => Profile(),
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
