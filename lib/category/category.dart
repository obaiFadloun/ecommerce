import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../service/productmodel/productmodel.dart';
class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  bool obay = false;
  ProductModel _ProductModel;
  getAllProduct()async{
    var headers =
    {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Accept-Charset": "application/json",
    };
    final response = await http.get( Uri.parse("http://127.0.0.1:8000/api/get_categories"),headers: headers);
    _ProductModel= ProductModel.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      setState(() {
        obay=true;
      });
    }
  }
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
          TopMenuTiles(name: "Makeup", imageUrl: "cosmetics", slug: ""),
          TopMenuTiles(name: "jeans", imageUrl: "jeans", slug: ""),
          TopMenuTiles(name: "T-shirt", imageUrl: "shirt", slug: ""),
          TopMenuTiles(name: "mobile", imageUrl: "smartphone", slug: ""),
          TopMenuTiles(name: "shoes", imageUrl: "sneakers", slug: ""),
          ],
          ),
      );

  }
}
class TopMenuTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String slug;
  TopMenuTiles(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.slug})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration:  BoxDecoration(boxShadow: const [
               BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),),]),
            child: Card(
                color: Colors.white, elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(
                    Radius.circular(3.0),),),
                child: Container(width: 50, height: 50,
                  child: Center(
                      child: Image.asset(
                        'assets/images/category/' + imageUrl + ".png",
                        width: 24,
                        height: 24,
                      )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}