import 'package:examplaapplication2024/feature/tabbar/mixed/cubit/mixed_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../model/mixed_models.dart';

class MixedCubit extends Cubit<MixedState> {
  final Dio _dio = Dio();

  MixedCubit() : super(InitMixedState());

  Future<void> fetchProducts() async {
    emit(LoadingMixedState());

    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final products =
            responseData.map((item) => Products.fromJson(item)).toList();
        emit(ResponseMixedState(products));
      } else {
        emit(ErrorMixedState('Failed to load products'));
      }
    } catch (error) {
      emit(ErrorMixedState('Error: $error'));
    }
  }
}
