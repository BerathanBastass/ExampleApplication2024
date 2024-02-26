import 'dart:convert';
import 'package:dio/dio.dart';
import '../model/mixed_models.dart';

class MixedService {
  final Dio _dio = Dio();
  List<Products> products = [];

  Future<List<Products>> getAll() async {
    {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final json = jsonDecode(response.data) as List;
        final result = json.map((e) {
          return Products(
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
