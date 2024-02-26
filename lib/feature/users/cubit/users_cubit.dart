import 'package:examplaapplication2024/feature/users/cubit/users_state.dart';
import 'package:examplaapplication2024/feature/users/model/users_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class UsersCubit extends Cubit<UsersState> {
  final Dio _dio = Dio();

  UsersCubit() : super(InitUsersState());

  Future<void> getUser() async {
    emit(LoadingUsersState());

    try {
      final response = await _dio.get('https://api.escuelajs.co/api/v1/users');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final users =
            responseData.map((item) => UserModel.fromJson(item)).toList();
        emit(ResponseUsersState(users));
      } else {
        emit(ErrorUsersState('Failed to load products'));
      }
    } catch (error) {
      emit(ErrorUsersState('Error: $error'));
    }
  }
}
