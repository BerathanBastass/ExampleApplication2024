import 'package:examplaapplication2024/core/function/local/appbar.dart';

import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';

class MixedScreenDetail extends StatefulWidget {
  MixedScreenDetail({super.key, required this.products});
  final Products products;

  @override
  State<MixedScreenDetail> createState() => _MixedScreenDetailState();
}

class _MixedScreenDetailState extends State<MixedScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(title: ""),
    );
  }
}
