import 'package:dio/dio.dart';
import 'package:examplaapplication2024/feature/product/view/electronic_page.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/cubit/electornic_cubit.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/cubit/electornic_states.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/ui/detail/electronic_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectronicScreen extends StatelessWidget {
  final Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    context.read<ElectronicCubit>().fetchFemale();

    return Scaffold(
      body: BlocBuilder<ElectronicCubit, ElectronicState>(
        builder: (context, state) {
          if (state is InitElectronicState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingElectronicState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResponseElectronicState) {
            return GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemCount: state.electronicModel.length,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    child: ElectronicItem(
                      electronic: state.electronicModel[index],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElectronicDetail(
                            electronic: state.electronicModel[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is ErrorElectronicState) {
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
