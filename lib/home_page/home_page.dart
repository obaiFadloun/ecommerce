import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_online_1/screen/makeup.dart';
import 'package:smart_store_online_1/screen/mobile.dart';
import '../category/category.dart';
import '../profile_test/home.dart';
import '../screen/clothes.dart';
import '../screen/popular.dart';
import '../screen/search_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({Key key, this.token}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    // int _page = 0;
    // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 600),
        items:  <Widget>[
          GestureDetector(
            child: Icon(

                Icons.home,
                color: Colors.black,
                textDirection: TextDirection.rtl,

                size: 30),
          ),
          GestureDetector(
            child: Icon(Icons.local_offer_outlined,
                color: Colors.black,
                size: 30),
          ),
          InkWell(
            onTap: ()=> Get.to(HomeView()),
            child: Icon(Icons.person,
                color: Colors.black,
                size: 30),
          ),
        ],
      ),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            TopMenus(),
            PopularWidget(),
            ClothesProduct(),
            MobileProduct(),
            MakeUpProduct(),
          ],
        ),
      ),
    ),
    );
  }
}
class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(_w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            50,
                (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: _w / 30, left: _w / 60, right: _w / 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}