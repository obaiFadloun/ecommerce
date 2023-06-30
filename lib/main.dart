import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store_online_1/pages/Sign_in.dart';

SharedPreferences prefs;

void main() async {
   prefs = await SharedPreferences.getInstance();
   print("token util main:  ${prefs.get("token")}");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Store',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SignInPage(),
    );
  }
}