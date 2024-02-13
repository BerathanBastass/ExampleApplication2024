import 'dart:async';

import 'package:examplaapplication2024/feature/bottombar/view/bottombar.dart';
import 'package:examplaapplication2024/feature/favorites/view/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/customcolors.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreens> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: CustomColors.pageColor,
      body: SpinKitFadingCircle(
        color: Colors.orange,
        size: 200,
        duration: Duration(seconds: 1),
      ),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
