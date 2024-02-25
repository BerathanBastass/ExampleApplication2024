import 'dart:async';
import 'package:examplaapplication2024/core/utils/customColors.dart';
import 'package:examplaapplication2024/feature/product/view/detail/demo_card_page.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/cart/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import '../../../../../core/widgets/rating.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';

class MixedDetailPage extends StatelessWidget {
  final Products product;

  List<Products> products = [];

  MixedDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return NewScaffold(
      product: product,
    );
  }
}

class NewScaffold extends StatefulWidget {
  const NewScaffold({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  _NewScaffoldState createState() => _NewScaffoldState(product: product);
}

class _NewScaffoldState extends State<NewScaffold> {
  final Products product;
  List<Products> products = [];
  final Dio _dio = Dio();

  _NewScaffoldState({required this.product});

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      Timer(const Duration(seconds: 0), () {
        setState(() {
          products =
              responseData.map((item) => Products.fromJson(item)).toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: Text('${product.title}'),
      ),
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: Transform.translate(
        offset: const Offset(0.0, -60.0),
        child: Column(
          children: [
            Image.network(
              product.image,
              width: 100,
              height: 300,
              alignment: Alignment.center,
            ),
            Transform.translate(
              offset: const Offset(5.0, -60.0),
              child: Text(
                'Description \n${product.description}',
                style: TextStyle(fontStyle: FontStyle.normal),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              children: [
                Transform.translate(
                  offset: Offset(0.0, -60.0),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 25,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(-50.0, -100.0),
                child: Text(
                  ' ${product.rating.count}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(-20.0, -135.0),
                child: const Icon(
                  FontAwesomeIcons.eye,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-120.0, -166.0),
                  child: Text(
                    '${product.rating.rate} -',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: const Offset(215.0, -170.0),
                child: FSRating(
                  rating: product.rating.rate,
                ),
              ),
            ),
            Container(
              height: 150,
              width: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ShotCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        color: _theme.scaffoldBackgroundColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(fontSize: 25),
                selectionColor: _theme.scaffoldBackgroundColor,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(
                        _theme.scaffoldBackgroundColor),
                    backgroundColor:
                        MaterialStateProperty.all(CustomColors.orangeColor)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCart()));
                },
                icon: const Icon(
                  FontAwesomeIcons.creditCard,
                ),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
