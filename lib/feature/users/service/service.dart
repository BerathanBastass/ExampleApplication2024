import 'dart:io';

import 'package:examplaapplication2024/feature/users/model/users_model.dart';

import 'package:dio/dio.dart';

class UsersService {
  final Dio dio = Dio();
  final String url = 'https://api.escuelajs.co/api/v1/users';
  List<Root> users = [];

  Future<void> getData() async {
    var response = await dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;
      if (data is List) {}
    }
  }
}
