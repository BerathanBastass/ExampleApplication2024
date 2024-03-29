import 'package:flutter/material.dart';

import '../../../core/utils/customcolors.dart';

void myfunctionBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: CustomColors.pageColor,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: CustomColors.pageColor,
          body: Container(
            decoration: const BoxDecoration(),
            height: 300,
          ),
        );
      });
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
