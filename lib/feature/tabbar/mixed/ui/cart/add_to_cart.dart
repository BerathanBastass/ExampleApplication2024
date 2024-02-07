import 'package:examplaapplication2024/core/function/local/appbar.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(title: "Add to Cart"),
    );
  }
}
