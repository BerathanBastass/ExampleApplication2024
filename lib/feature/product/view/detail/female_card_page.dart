import 'package:examplaapplication2024/feature/tabbarr/views/female/model/female_model.dart';
import 'package:flutter/material.dart';
import 'package:examplaapplication2024/core/utils/customcolors.dart';
import 'package:examplaapplication2024/feature/settings/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../favorites/cubit/layot_cubit.dart';

class FemaleCard extends StatelessWidget {
  final FemaleModel femaleModel;
  FemaleCard({required this.femaleModel});
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
              femaleModel.image,
              height: 50,
              width: 300,
              alignment: Alignment.center,
            ),
            Flexible(
              child: Center(
                child: Text(
                  femaleModel.title,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  '\$${femaleModel.price}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
