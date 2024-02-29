import 'package:examplaapplication2024/feature/tabbarr/views/female/model/female_model.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../favorites/cubit/layot_cubit.dart';

class FemaleItem extends StatelessWidget {
  final FemaleModel female;
  FemaleItem({required this.female});

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
              female.image,
              height: 50,
              width: 500,
              alignment: Alignment.center,
            ),
            Flexible(
              child: Center(
                child: Text(
                  female.title,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '\$${female.price}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: CustomColors.orangeColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
