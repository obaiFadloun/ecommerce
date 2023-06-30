import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_store_online_1/constans/colors.dart';
import 'package:smart_store_online_1/second_screens/clothes_types.dart';
import '../add_to_cart_id/add_cart.dart';
import '../cart_UUII/cartScreen.dart';
import '../constans/constans.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;
import '../constans/custome_snack_bar.dart';
import '../main.dart';
import '../service/auth.dart';
import '../service/http.dart';

class DetailsScreenMakeup extends StatefulWidget {
  final String ImageNet;
  final String token;
  final String price;
  final String Text;
  final int quantity; // Add this
  final String product;

  const DetailsScreenMakeup({
    Key key,
    this.ImageNet,
    this.price,
    this.Text,
    this.quantity, // Add this
    this.product,
    this.token,
  }) : super(key: key);

// rest of the widget implementation
  @override
  State<DetailsScreenMakeup> createState() => _DetailsScreenMakeupState();
}
class _DetailsScreenMakeupState extends State<DetailsScreenMakeup> {
  _DetailsScreenMakeupState();
  @override
  void initState() {
    super.initState();
    getToken().then((value) {
      setState(() {
        Api.token = value;
      });
    });
  }
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  dynamic AddToCartModel(String product, int quantity, String token) async {
    try {
      print('AddToCart function called with product: $product and quantity: $quantity');
      http.Response response = await Api1.addToCart(quantity, product, token);
      final data = json.decode(response.body);
      var statusCode = response.statusCode;
      if (statusCode == 200 || data["status"] == true) {
        final successMessage = data['data'];
        CustomeSnackBarTrue("Add to cart Successfully ", "", "");
      } else {
        final errorMessage = data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print("ERRRORRR: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Item", style: TextStyle(color: Colors.black)),
        backgroundColor: kBlueColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.to(ClothesScreen()),
        ),
        actions: <Widget>[
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            showBadge: true,
            ignorePointer: false,
            child: IconButton(
              color: Colors.black87,
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: ()=> Get.to(
                  CartScreen(
                    quantity: controller.quantity.value,
                  )),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  width: 260,
                  height: 260,
                  image: NetworkImage(widget.ImageNet),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                elevation: 1,
                margin: const EdgeInsets.all(5),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.Text,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF3a3a3b),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF3a3a3b),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: const <Widget>[
                  Text(
                    "by",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFa9a9a9),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "ZARA",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1f1f1f),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MainContainer(
                      color: kBlueColor,
                      child: Obx(() => CounterWidget(
                        title: "Quantity",
                        value: controller.quantity.value,
                        onIncreaseButtonPressed: controller.increaseQuantity,
                        onDecreaseButtonPressed: controller.decreaseQuantity,
                        min: 1,
                        price: widget.price,

                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Size",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              DetailScreenSelectSize(),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Colors",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              Row(
                children: [
                  ColorDot(
                      color: Colors.amberAccent,
                      isActive: false,
                      press: () {}
                  ), ColorDot(
                      color: Colors.green,
                      isActive: true,
                      press: () {}
                  ), ColorDot(
                      color: Colors.red,
                      isActive: false,
                      press: () {}
                  ), ColorDot(
                      color: Colors.black,
                      isActive: false,
                      press: () {}
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        print('${widget.product}   hello product');
                        print('${widget.quantity}   hello quantity');
                        print('${Api.token}   hello token');
                        AddToCartModel(
                            widget.product,
                            widget.quantity,
                            Api.token);
                      },
                      child: Container(
                        width: 200.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: kBlueColor,
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Add To Bag',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key key,
    this.child,
    this.color,
    this.onTap,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}
class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    this.title,
    this.value,
    this.onIncreaseButtonPressed,
    this.onDecreaseButtonPressed,
    this.min,
    this.max,
    this.price,
  }) : super(key: key);
  final int min;
  final int max;
  final String title;
  final int value;
  final void Function() onIncreaseButtonPressed;
  final void Function() onDecreaseButtonPressed;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  onDecreaseButtonPressed();
                  Get.find<ProductController>().decreasePrice;
                },
                child: const Icon(Icons.remove),
                fillColor: kBlueColor,
                shape: const CircleBorder(),
                constraints: const BoxConstraints.tightFor(
                  width: 38,
                  height: 38,
                ),
                elevation: 3,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: kTextStyle1,
              ),
              Text(
                "$value",
                style: kNumberStyle,
              ),
              SizedBox(
                width: 12,
              ),
              RawMaterialButton(
                onPressed: () {
                  onIncreaseButtonPressed();
                  Get.find<ProductController>().increasePrice;
                },
                child: const Icon(
                  Icons.add,
                ),
                fillColor: kBlueColor,
                shape: const CircleBorder(),
                constraints: const BoxConstraints.tightFor(
                  width: 38,
                  height: 38,
                ),
                elevation: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
//
// class Counter extends StatelessWidget {
//   final ProductController controller = Get.put(ProductController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: MainContainer(
//             color: kBlueColor,
//             child: Obx(() => CounterWidget(
//               title: "Quantity",
//               value: controller.quantity.value,
//               onIncreaseButtonPressed: controller.increaseQuantity,
//               onDecreaseButtonPressed: controller.decreaseQuantity,
//               min: 1,
//               price: widget.price,
//
//             )),
//           ),
//         ),
//       ],
//     );
//   }
// }

class ProductController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 0.0.obs;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void increasePrice(double price) {
    totalPrice.value += price;
  }

  void decreasePrice(double price) {
    if (totalPrice.value > price) {
      totalPrice.value -= price;
    }
  }
}

class Api {
  static String token="";
  static User user;
  static Future<http.Response> login (
      String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/login');
    http.Response response = await http.post(
      url,
      headers: headers(token),
      body: body,
    );
    Map<String, dynamic> responseBody = json.decode(response.body);
    if (responseBody['data']['success'] == true) {
      print("test");
      token = responseBody['data']['token'];
      print("1: $token");
      user = User.fromJson(responseBody['data']['user']);
      await UtilSharedPreferences.setToken(token);
    }
    print(response.body);
    return response;
  }
}
class UtilSharedPreferences {
  static Future<String> getToken() async {
    String token = prefs.getString('token') ?? '';
    print('Retrieved token from shared preferences: $token');
    return token;
  }
  static Future<void> setToken(String value) async {
    print('Setting token in shared preferences: $value');
    await prefs.setString('token', value);
  }
}
class SizeModel {
  String title;
  SizeModel({ this.title});
}
class DetailScreenSelectSize extends StatefulWidget {
  const DetailScreenSelectSize({Key key}) : super(key: key);

  @override
  State<DetailScreenSelectSize> createState() => _DetailScreenSelectSizeState();
}
class _DetailScreenSelectSizeState extends State<DetailScreenSelectSize> {
  int currentSelected = 2;
  List<SizeModel> sizesList = [
    SizeModel(title: 'M'),
    SizeModel(title: 'L'),
    SizeModel(title: 'XL'),
    SizeModel(title: 'XXL'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sizesList.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10); // Adjust the width as per your requirement
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(defaultPadding / 4),
              height: 70,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentSelected == index
                    ? AppColors.kSecondaryColor
                    : AppColors.darkWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGrey.withOpacity(.7),
                    blurRadius: 5,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                sizesList[index].title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  // color: currentSelected == i ? Colors.white : kSecondaryColor,
                ),
              ),

            ),
          );
        },
      ),
    );
  }
}
