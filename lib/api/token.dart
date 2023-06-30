import 'dart:convert';
import '../service/auth.dart';
import 'package:http/http.dart' as http;
import '../service/http.dart';

class Api {
  static String token="";
  static User user;
  static Future<http.Response> login (
      String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/login');
    http.Response response = await http.post(
      url,
      headers: headers(token),
      body: body,
    );
    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody['data']['success'] == true) {
      print("test");
      token = responseBody['data']['token'];
      print("1: $token");
      user = User.fromJson(responseBody['data']['user']);
      // await UtilSharedPreferences.setToken(token);
    }
    print(response.body);
    return response;
  }
}
