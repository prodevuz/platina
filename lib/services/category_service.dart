import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:platina/models/post_model.dart';

class CategoryService {
  static Future<List<Category>> fetchCategories() async {
    final headers = {
      'X-PLATINA-API-KEY': 'QdO5hA3D.iSevNc03mulrumyLiPqlcM03M9clZdDQ'
    };

    final response = await http.get(
      Uri.parse('https://cp.dev.platina.uz/uz-latn/api/categories/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
