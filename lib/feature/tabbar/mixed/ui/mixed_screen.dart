import 'dart:async';

import 'package:dio/dio.dart';

import 'package:examplaapplication2024/feature/tabbar/mixed/ui/detail/mixed_detal.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/customcolors.dart';
import '../demo_page.dart';
import '../model/mixed_models.dart';

class MixedScreen extends StatefulWidget {
  @override
  _MixedScreenstate createState() => _MixedScreenstate();
}

class _MixedScreenstate extends State<MixedScreen> {
  final Dio _dio = Dio();
  List<Products> products = [];

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
        Timer(Duration(seconds: 1), () {
          setState(() {
            products =
                responseData.map((item) => Products.fromJson(item)).toList();
          });
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
      body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Container(
              child: InkWell(
                  child: ProductItem(product: products[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MixedDetailPage(product: products[index])),
                    );
                  }),
            );
          }),
    );
  }
}
