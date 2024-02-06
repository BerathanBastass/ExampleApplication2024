import 'package:dio/dio.dart';

import 'package:examplaapplication2024/core/utils/customcolors.dart';

import 'package:flutter/material.dart';

import '../demo_page.dart';
import '../model/mixed_models.dart';

class MixedScreen extends StatefulWidget {
  @override
  _MixedScreenstate createState() => _MixedScreenstate();
}

class _MixedScreenstate extends State<MixedScreen> {
  final Dio _dio = Dio();
  List<Products> products = [];
  late Products product;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        setState(() {
          products =
              responseData.map((item) => Products.fromJson(item)).toList();
        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageColor,
      body: GestureDetector(
        onTap: () async {},
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          },
        ),
      ),
    );
  }
}
