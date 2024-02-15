import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static Future<String> authenticateUser(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('https://your-api-url.com/uz/auth-token/'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData['token'];
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
