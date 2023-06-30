import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store_online_1/home_page/home_page.dart';
import 'package:smart_store_online_1/pages/Sign_in.dart';

import '../splash_screen/splash_screen.dart';



class AuthMaterial extends StatefulWidget {
  const AuthMaterial({Key key}) : super(key: key);
  @override
  State<AuthMaterial> createState() => _AuthMaterialState();
}
class _AuthMaterialState extends State<AuthMaterial> {
  String token1;
  bool initial = true;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token1 = sharedPrefValue?.getString('token')?? '';
          print("token:$token1"); // Add this line to print the token value
        });
      });
      return SecondPage();
    }
    else {
      if (token1 == null){
        return SignInPage();
      }
      else {
        return HomePage();
      }
    }
  }
}
