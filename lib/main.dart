import 'package:examplaapplication2024/feature/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'feature/auth/sign_up.dart';
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
