import 'package:examplaapplication2024/feature/tabbar/mixed/model/mixed_models.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    final _theme = context.read<ChangeThemeCubit>().getAppTheme(context).theme;
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.saltWhite, width: 10),
        ),
        child: Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image,
                height: 40,
                width: 500,
                alignment: Alignment.center,
              ),
              Flexible(
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ),
              Flexible(
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
