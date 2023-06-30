  import 'dart:convert';
  import 'package:circular_profile_avatar/circular_profile_avatar.dart';
  import 'package:flutter/material.dart';
  import 'package:smart_store_online_1/profile_test/appBar.dart';
  import 'package:smart_store_online_1/profile_test/profile.dart';
  import '../constans/CircleProg.dart';
  import '../constans/constans.dart';
  import '../main.dart';
  import 'package:http/http.dart' as http;
  import '../pages/Sign_in.dart';
  import 'cl.dart';
  import 'logout_model.dart';

  class HomeView extends StatefulWidget {
    @override
    _HomeViewState createState() => _HomeViewState();
  }

  class _HomeViewState extends State<HomeView> {
    Future<LogOutModel> logout() async {
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.get("token")}',
      };
      final url = Uri.parse('http://127.0.0.1:8000/api/logout');
      try {
        final response = await http.get(url, headers: headers);
        var log = json.decode(response.body);
        if (response.statusCode == 200 || log['status'] == true) {
          final jsonData = json.decode(response.body);
          final logoutModel = LogOutModel.fromJson(jsonData);
          return logoutModel;
        } else {
          print('Logout request failed with status code: ${response.statusCode}');
          return null;
        }
      } catch (error) {
        print('Logout request failed: $error');
        return null;
      }
    }
    Future<GetProfile> fetchProfileDetails() async {
      final Map<String, String> headers = {
        'Authorization': 'Bearer ${prefs.get("token")}',
      };
      final Uri url = Uri.parse('http://127.0.0.1:8000/api/get_user_profile');
      final response = await http.get(url, headers: headers);
      var res = json.decode(response.body);

      if (response.statusCode == 200 || res['status'] == true) {
        final jsonData = json.decode(response.body);
        print("RESPONSE BODY " + response.body);
        final profile = GetProfile.fromJson(jsonData);
        return profile;
      } else {
        throw Exception('Failed to fetch profile details: ${response.statusCode}');
      }
    }

    Future<void> fetchProfile() async {
      try {
        final fetchedProfile = await fetchProfileDetails();
        setState(() {
          _getprofile = fetchedProfile;
        });
      } catch (e) {
        // Handle the error
        print(e);
      }
    }

    GetProfile _getprofile;

    @override
    void initState() {
      super.initState();
      fetchProfile();
      logout();
    }

    @override
    Widget build(BuildContext context) {
      return  _getprofile == null
          ? Builder(
        builder: (BuildContext context) => CircleProgressStyle(),
      ) : Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             Container(
                height: 300.0,
                child: Stack(
                  children: <Widget>[
                    Container(),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: 300.0,
                        color: kBlueColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProfileAvatar(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe2mHjhf_0E2RUH8SXrVaw-FPJ6whDt7awjQ&usqp=CAU",
                            borderWidth: 4.0,
                            radius: 60.0,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            _getprofile.data.name,
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Developer",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TopBar(),
                  ],
                ),
              ),
              Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 21.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                              size: 40.0,
                              color: kBlueColor,
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Your Name",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(height: 4.0),
                              Text(
                                _getprofile.data.name,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 21.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on,
                              size: 40.0,
                              color: kBlueColor,
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Your Address",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Al Akram mosque - Mazzeh',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 21.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mail,
                              size: 40.0,
                              color: kBlueColor,
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Your E-mail",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                _getprofile.data.email,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 21.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              logout().then((result) {
                                if (result != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInPage(),
                                    ),
                                  );
                                } else {
                                  print("Error LogOut:::::");
                                }
                              });
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 40.0,
                              color: kBlueColor,
                            ),
                          ),

                          SizedBox(width: 24.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Text(
                                "Log-out",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
                ),
              ),

      );
    }
  }
