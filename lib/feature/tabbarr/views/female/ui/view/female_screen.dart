import 'package:dio/dio.dart';
import 'package:examplaapplication2024/feature/product/view/female_pages.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/female/cubit/female_cubit.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/female/cubit/female_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../detail/female_detail.dart';

class FemaleScreen extends StatelessWidget {
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    context.read<FemaleCubit>().fetchFemale();

    return Scaffold(
      body: BlocBuilder<FemaleCubit, FemaleState>(
        builder: (context, state) {
          if (state is InitFemaleState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingFemaleState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResponseFemaleState) {
            return GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemCount: state.femaleModel.length,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    child: FemaleItem(female: state.femaleModel[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FemaleDetailPage(
                            female: state.femaleModel[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is ErrorFemaleState) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
