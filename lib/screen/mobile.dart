import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_store_online_1/constans/constans.dart';
import 'package:smart_store_online_1/screen/popular.dart';
import 'package:smart_store_online_1/second_screens/mobile_types.dart';
import '../Fillter/fillter.dart';
import 'package:http/http.dart' as http;
import '../second_screens/clothes_types.dart';


class MobileProduct extends StatefulWidget {
  @override
  _MobileProductState createState() => _MobileProductState();
}

class _MobileProductState extends State<MobileProduct> {
  FilterProducts _filterProducts;

  Future<FilterProducts> fetchFilteredData(int categoryId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/filter_by?category_id=$categoryId'));
    print("Response Body ::" +response.body );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return FilterProducts.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch filtered data');
    }
  }

  @override
  void initState() {
    super.initState();
    _filterProducts = FilterProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: double.infinity,
      child:Column(
        children: <Widget>[
          PopularFoodTitle(),
          FutureBuilder<FilterProducts>(
            future: fetchFilteredData(3),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final _filterProducts = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                      itemCount: _filterProducts.data.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MobileScree(),
                              ),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [],
                                ),
                                child: Card(
                                    color: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Container(
                                      width: 170,
                                      height: 210,
                                      child: Column(
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  alignment: Alignment.topRight,
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(
                                                    right: 5,
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    height: 28,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white70,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color(0xFFfae3e2),
                                                          blurRadius: 25.0,
                                                          offset: Offset(0.0, 0.75),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: Color(0xFFfb3132),
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Center(
                                                  child: Ink.image(
                                                    image: NetworkImage(
                                                      baseImageUrl +
                                                          _filterProducts.data
                                                              .data[index].image,
                                                    ),
                                                    width: 130,
                                                    height: 140,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                padding: EdgeInsets.only(
                                                  left: 5,
                                                  top: 5,
                                                ),
                                                child: Text(
                                                  _filterProducts
                                                      .data.data[index].title,
                                                  style: TextStyle(
                                                    color: Color(0xFF6e6e71),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topRight,
                                                padding: EdgeInsets.only(right: 5),
                                                child: Container(
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white70,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color(0xFFfae3e2),
                                                        blurRadius: 25.0,
                                                        offset: Offset(0.0, 0.75),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                    Icons.near_me,
                                                    color: Color(0xFFfb3132),
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 5, top: 5),
                                                    child: Text(
                                                        _filterProducts.data
                                                            .data[index].ratingSum,
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6e6e71),
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w400)),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 3, left: 5),
                                                    child: Row(
                                                      children: const <Widget>[
                                                        Icon(
                                                          Icons.star,
                                                          size: 10,
                                                          color: Color(0xFF9b9b9c),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    padding: EdgeInsets.only(
                                                        left: 5, top: 5),
                                                    child: Text("1",
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6e6e71),
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w400)),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.bottomLeft,
                                                padding: EdgeInsets.only(
                                                    left: 5, top: 5, right: 5),
                                                child: Text(
                                                    _filterProducts
                                                        .data.data[index].title,
                                                    style: TextStyle(
                                                        color: Color(0xFF6e6e71),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w600)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );

                      }
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              // Show a loading indicator while data is being fetched
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
class PopularFoodTitle extends StatefulWidget {
  @override
  State<PopularFoodTitle> createState() => _PopularFoodTitleState();
}
class _PopularFoodTitleState extends State<PopularFoodTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  <Widget>[
          Text(
            "Mobile",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          InkWell(
            onTap: () =>  Get.to(MobileScree()),
            child: Text(
              "See all",
              style: TextStyle(
                  fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }
}