import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:examplaapplication2024/feature/tabbar_contents/electronic/model/electronic_model.dart';

class ElectronicService {
  final Dio _dio = Dio();
  List<ElectronicModel> electronic = [];

  Future<List<ElectronicModel>> getAll() async {
    {
      final response =
          await _dio.get('https://fakestoreapi.com/products?limit=5');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final json = jsonDecode(response.data) as List;
        final result = json.map((e) {
          return ElectronicModel(
              id: e['id'],
              title: e['title'],
              price: e['price'],
              description: e['description'],
              category: e['category'],
              image: e['image'],
              rating: e['rating']);
        }).toList();
        return result;
      } else {
        throw "Something went wrong code ${response.statusCode}";
      }
    }
  }
}
