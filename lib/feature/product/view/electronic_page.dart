import 'package:examplaapplication2024/feature/tabbarr/views/electronic/model/electronic_model.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../favorites/cubit/layot_cubit.dart';

class ElectronicItem extends StatelessWidget {
  final ElectronicModel electronic;

  ElectronicItem({required this.electronic});

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
              electronic.image,
              height: 50,
              width: 500,
              alignment: Alignment.center,
            ),
            Flexible(
              child: Center(
                child: Text(
                  electronic.title,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '\$${electronic.price}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.normal),
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
