import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:platina/models/post_model.dart';

class PostService {
  static Future<List<Post>> fetchPosts() async {
    final headers = {
      'X-Platina-Api-Key': 'QdO5hA3D.iSevNc03mulrumyLiPqlcM03M9clZdDQ',
      'Accept': 'application/json',
    };

    final response = await http.get(
      Uri.parse('https://cp.dev.platina.uz/uz-latn/api/posts/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> jsonData = jsonResponse['results'];
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
