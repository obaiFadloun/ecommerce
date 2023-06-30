import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_store_online_1/constans/CircleProg.dart';
import 'package:smart_store_online_1/details_screen/details_of_makeup.dart';
import 'package:smart_store_online_1/home_page/home_page.dart';
import 'dart:convert';
import '../Fillter/fillter.dart';
import '../constans/constans.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MakeUpScreen extends StatefulWidget {
  const MakeUpScreen({Key key, }) : super(key: key);
  @override
  State<MakeUpScreen> createState() => _MakeUpScreenState();
}
class _MakeUpScreenState extends State<MakeUpScreen> {
  _MakeUpScreenState();

  bool obay = false;
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
    Size size = MediaQuery.of(context).size;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black ,
          ),
          onPressed:  () => Get.to(HomePage()),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      body: FutureBuilder<FilterProducts>(
        future: fetchFilteredData(2),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _filterProducts = snapshot.data;
            return  AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.all(_w / 30),
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: _filterProducts.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300.0,
                      child: FlipAnimation(
                        duration: Duration(
                            milliseconds: 3000
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        flipAxis: FlipAxis.y,
                        child: Container(
                          margin: EdgeInsets.only(bottom: _w / 20),
                          height: _w / 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () =>
                                Get.to(
                                  DetailsScreenMakeup(
                                    ImageNet: baseImageUrl + _filterProducts.data.data[index].image,
                                    Text: _filterProducts.data.data[index].title,
                                    price: _filterProducts.data.data[index].name+" SYP",
                                    product: _filterProducts.data.data[index].id.toString(),
                                    quantity: _filterProducts.data.data[index].id,
                                    token: Api.token,
                                  ),
                                ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: 136,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: index.isEven ? kBlueColor : kSecondaryColor,
                                    boxShadow:  const [kDefaultShadow],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Hero(
                                    tag: {""},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                                      height: 160,
                                      width: 200,
                                      child: Image.network(baseImageUrl+_filterProducts.data.data[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                // Product title and price
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: SizedBox(
                                    height: 136,
                                    width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: kDefaultPadding),
                                          child:Text(_filterProducts.data.data[index].title,
                                            style: Theme.of(context).textTheme.button,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding * 1.5, // 30 padding
                                            vertical: kDefaultPadding / 4, // 5 top and bottom
                                          ),
                                          decoration: BoxDecoration(
                                            color: kSecondaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(_filterProducts.data.data[index].name+" SYP",
                                            style: Theme.of(context).textTheme.button,
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
                      ),
                    ),
                  );
                },
              ),
            );
          }
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          // Show a loading indicator while data is being fetched
          return CircleProgressStyle();
        },
      ),

    );
  }
}
