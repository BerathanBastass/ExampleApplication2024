import 'package:examplaapplication2024/feature/tabbar_contents/electronic/cubit/electornic_states.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/model/electronic_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class ElectronicCubit extends Cubit<ElectronicState> {
  final Dio _dio = Dio();

  ElectronicCubit() : super(InitElectronicState());

  Future<void> fetchFemale() async {
    emit(LoadingElectronicState());

    try {
      final response =
          await _dio.get('https://fakestoreapi.com/products?limit=5');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final female =
            responseData.map((item) => ElectronicModel.fromJson(item)).toList();
        emit(ResponseElectronicState(female));
      } else {
        emit(ErrorElectronicState('Failed to load products'));
      }
    } catch (error) {
      emit(ErrorElectronicState('Error: $error'));
    }
  }
}
