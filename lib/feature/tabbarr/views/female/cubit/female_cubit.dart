import 'package:examplaapplication2024/feature/tabbarr/views/female/cubit/female_states.dart';
import 'package:examplaapplication2024/feature/tabbarr/views/female/model/female_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class FemaleCubit extends Cubit<FemaleState> {
  final Dio _dio = Dio();

  FemaleCubit() : super(InitFemaleState());

  Future<void> fetchFemale() async {
    emit(LoadingFemaleState());

    try {
      final response =
          await _dio.get('https://fakestoreapi.com/products?sort=desc');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final female =
            responseData.map((item) => FemaleModel.fromJson(item)).toList();
        emit(ResponseFemaleState(female));
      } else {
        emit(ErrorFemaleState('Failed to load products'));
      }
    } catch (error) {
      emit(ErrorFemaleState('Error: $error'));
    }
  }
}
