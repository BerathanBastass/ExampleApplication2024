import 'package:examplaapplication2024/core/cubit/layot_cubit.dart';
import 'package:examplaapplication2024/core/cubit/layout_states.dart';
import 'package:examplaapplication2024/core/function/local/appbar.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:examplaapplication2024/feature/tabbar/mixed/ui/cart/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constructors/rating.dart';

class MixedDetailPage extends StatelessWidget {
  final Products product;
  List<Products> products = [];

  MixedDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit([], FavoriteStates()),
      child: newScaffold(
        product: product,
      ),
    );
  }
}

class newScaffold extends StatelessWidget {
  const newScaffold({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(title: product.title),
      backgroundColor: CustomColors.pageColor,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Transform.translate(
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
                offset: Offset(0.0, -60.0),
                child: Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    decorationColor: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(
                children: [
                  Transform.translate(
                    offset: Offset(0.0, -60.0),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
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
                        color: Colors.black,
                        decorationColor: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.normal),
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
              Transform.translate(
                offset: Offset(-175, -200),
                child: BlocBuilder<FavoriteCubit, CubitUserStates>(
                  builder: (context, state) {
                    bool isFavorite =
                        context.watch<FavoriteCubit>().isExist('${product.id}');

                    return IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().getData('${product.id}');
                      },
                      icon: Icon(
                        isFavorite
                            ? FontAwesomeIcons.heart
                            : FontAwesomeIcons.solidHeart,
                        size: 30,
                        color: isFavorite ? Colors.black : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        color: CustomColors.pageColor,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(fontSize: 25),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
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
