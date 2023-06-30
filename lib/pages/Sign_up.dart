import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../date/date.dart';
import 'Sign_in.dart';
import 'package:http/http.dart' as http;
import '../constans/custome_snack_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key,
  }) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {

  final formKey = GlobalKey<FormState>();
  bool tryToSignIn = false;
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController confirmPasswordController = TextEditingController(text: "");

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool loading = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
    String name,email;
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white70,
        ),
        child: Form(
          key: _fromKey,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 22,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/op.png",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value){
                          if(value.isEmpty)
                            {
                              return "please enter name";
                            }
                          if (!RegExp("[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid name';
                          }
                          return null;
                        },
                        onSaved: (String value){
                          name = value;
                        },
                        controller: nameController,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,),),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person_sharp,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          labelStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          labelText: "Full name",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          email = value;
                        },
                        controller: emailController,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,),),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xFF666666),
                            size: defaultIconSize,
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          labelStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize),
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                       validator: (String value){
                         if (value.isEmpty){
                           return "Please enter password";
                         }
                         return null;
                      },
                        controller: passwordController,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.red,
                            size: defaultIconSize,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(Icons.remove_red_eye,
                              color: Color(0xFF666666),
                              size: defaultIconSize,
                            ),
                          ),
                          fillColor: Color(0xFFF2F3F5),
                          labelStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          labelText: "Password",
                        ),
                      ),
                       SizedBox(height: 15,),
                      TextFormField(
                        validator: (String value){
                          if (value.isEmpty){
                            return "Please enter re-password";
                          }
                          if (passwordController.text != confirmPasswordController.text)
                            {
                              return "Password Do not match";
                            }
                          return null;
                        },
                        controller: confirmPasswordController,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.red,
                            size: defaultIconSize,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(Icons.remove_red_eye,
                              color: Color(0xFF666666),
                              size: defaultIconSize,
                            ),

                          ),
                          fillColor: Color(0xFFF2F3F5),
                          labelStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                          ),
                          labelText: "Confirm Password",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Color(0xFFfbab66),
                            ),
                            BoxShadow(
                              color: Color(0xFFf7418c),
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: const [Color(0xFFf7418c), Color(0xFFfbab66)],
                              begin: const FractionalOffset(0.2, 0.2),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: MaterialButton(

                          highlightColor: Colors.transparent,
                          splashColor: Color(0xFFf7418c),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontFamily: "WorkSansBold"
                              ),
                            ),
                          ),
                          onPressed: () async{
                              var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/register",),
                                  body: {
                                "name":nameController.text,
                                "email":emailController.text,
                                "password":passwordController.text,
                                "password_confirmation":confirmPasswordController.text,
                              });

                              var res = await json.decode(response.body);
                                 print(response.body + "Success");
                              if (res['status']== true){
                                CustomSignUPSucc("SignUp Successfully ","", "");
                              }else {
                                CustomSignUPFalse("this account is already create","", "");
                              }
                            if (_fromKey.currentState.validate()) {
                              print("Successfully");
                              return;
                            }
                            else {
                              print("UnSuccessfully");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FacebookGoogleLogin(),
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 50),
                              Container(
                                height: 20,
                                child: Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                  Get.to(SignInPage()),
                                child: Container(
                                  height: 20,
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: Color(0xFFf7418c),
                                      fontFamily: defaultFontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: defaultFontSize,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// SignInButtonWidget
}
 class FacebookGoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            Colors.black12,
                            Colors.black54,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Color(0xFF2c2b2b),
                          fontSize: 16.0,
                          fontFamily: "WorkSansMedium"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            Colors.black54,
                            Colors.black12,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 40.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:  EdgeInsets.all(15.0),
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFf7418c),
                      ),
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () => {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFf7418c),
                      ),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
