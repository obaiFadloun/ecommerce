import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_online_1/constans/CircleProg.dart';
import '../add_to_cart_id/get_cart.dart';
import '../api/token.dart';
import '../constans/constans.dart';
import '../home_page/home_page.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key key,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int counter = 2;
  bool service = false;
  GetCartModel _getCartModel;

  Future<GetCartModel> getCartModel() async {
    try {
      final response = await Api2.getCartOrder(Api.token);
      if (response.statusCode == 200) {
        print("hello response ::  ${response.body}");
        final getCartModel = GetCartModel.fromJson(json.decode(response.body));
        print(getCartModel.toString());
        return getCartModel;
      }
      if (response.statusCode == 401) {
        print("Error: ${json.decode(response.body)['message']}");
      }
    } catch (e) {
      print("error $e");
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    getCartModel().then((cartModel) {
      setState(() {
        _getCartModel = cartModel;
        service = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text("Your Item",
          style: TextStyle(
            color: Colors.black,
          ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.to(HomePage()),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: service ? AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _getCartModel.data.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
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
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            height: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: index.isEven
                                  ? kBlueColor
                                  : kSecondaryColor,
                              boxShadow: const [kDefaultShadow],
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
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                height: 160,
                                width: 200,
                                child: Image.network(baseImageUrl + _getCartModel.data[index].products.image,
                                  fit: BoxFit.cover,
                                ),
                              ),

                          ),
                          // Product title and price
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      _getCartModel.data[index].products.title,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .button,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding * 1.5,
                                      // 30 padding
                                      vertical: kDefaultPadding /
                                          4, // 5 top and bottom
                                    ),
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22),
                                      ),
                                    ),
                                    child: Text(
                                      _getCartModel.data[index].products.slug+
                                          " SYP",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .button,
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
            );
          },
        ),
      ) : Center(
        child: CircleProgressStyle(

        ),
      ),
    );
  }
}
