import '../service/http.dart' ;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api1 {
  static Future<http.Response> addToCart(
      int quantity,
      String product,
      String token,
      ) async {
    Map data = {
      'product_id': product,
      'product_quantity': quantity,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/add_to_cart');
    http.Response response = await http.post(
      url,
      headers: headers(token),
      body: body,
    );
    print(response.body);
    return response;
  }
}
class AddToCartModel {
  bool status;
  String data;
  int code;

  AddToCartModel({this.status, this.data, this.code});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['code'] = this.code;
    return data;
  }
}