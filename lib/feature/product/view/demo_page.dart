import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favorites/cubit/layot_cubit.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.saltWhite, width: 10),
      ),
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 50,
              width: 500,
              alignment: Alignment.center,
            ),
            Flexible(
              child: Center(
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                cubit.isExist(product) ? Icons.favorite : Icons.favorite,
                color: CustomColors.orangeColor,
              ),
              onPressed: () {
                cubit.toggleFavorites(product);
              },
            ),
          ],
        ),
      ),
    );
  }
}
