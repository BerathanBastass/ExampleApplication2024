import 'package:dio/dio.dart';
import 'package:examplaapplication2024/core/interfaces/login_interface.dart';
import 'package:examplaapplication2024/feature/auth/s%C4%B1gn_%C4%B1n/model/user_model.dart';

class LoginService implements ILogin {
  @override
  Future<UserModel?> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(email: email, token: body['token']);
    } else {
      return null;
    }
  }
}
