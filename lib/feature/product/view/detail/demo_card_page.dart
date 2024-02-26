import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorites/cubit/layot_cubit.dart';

class ShotCard extends StatelessWidget {
  final Products product;

  ShotCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.saltWhite, width: 15),
      ),
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 50,
              width: 300,
              alignment: Alignment.center,
            ),
            Flexible(
              child: Center(
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
