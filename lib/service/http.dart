import 'package:flutter/material.dart';


const String baseURL = "http://127.0.0.1:8000/api";

Map<String, String> headers (String token){
Map<String, String> _headers = {

"Content-Type": "application/json",
'Authorization': 'Bearer $token',

};
return _headers;
}
  errorSnackBar (BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
  );
}
