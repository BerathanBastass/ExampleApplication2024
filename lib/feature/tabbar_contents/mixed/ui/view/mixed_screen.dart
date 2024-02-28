import 'package:dio/dio.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/mixed/ui/detail/mixed_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../product/view/demo_page.dart';
import '../../cubit/mixed_cubit.dart';
import '../../cubit/mixed_states.dart';

class MixedScreen extends StatelessWidget {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    context.read<MixedCubit>().fetchProducts();

    return Scaffold(
      body: BlocBuilder<MixedCubit, MixedState>(
        builder: (context, state) {
          if (state is InitMixedState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingMixedState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResponseMixedState) {
            return GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    child: ProductItem(product: state.products[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MixedDetailPage(product: state.products[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is ErrorMixedState) {
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
