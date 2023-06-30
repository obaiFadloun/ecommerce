import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:smart_store_online_1/Fillter/filter_home.dart';
import 'package:smart_store_online_1/cart_UUII/paymentMethod.dart';
import 'package:smart_store_online_1/cart_UUII/stripe.dart';
import 'package:smart_store_online_1/cart_UUII/visacard_ui.dart';
import 'package:smart_store_online_1/constans/CircleProg.dart';
import '../add_to_cart_id/delet_cart.dart';
import '../add_to_cart_id/get_cart.dart';
import '../api/token.dart';
import '../constans/constans.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key, this.quantity}) : super(key: key);
  final int quantity;

  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  int currentQuantity;
  int counter = 2;
  bool service = false;
  GetCartModel _getCartModel;
  DeleteCart _deleteCart;

  Future<void> deleteCart(productId) async {
    const url = 'http://127.0.0.1:8000/api/remove_cart';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${prefs.get("token")}',
        },
        body: json.encode({'product_id': productId}),);
      if (response.statusCode == 200) {
        print('Item removed from cart');
        setState(() {
          _getCartModel.data.removeWhere((item) => item.products.id == productId);
        });
        getCartModel().then((cartModel) {
          setState(() {
            _getCartModel = cartModel;
          });
        });
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<GetCartModel> getCartModel() async {
    try {
      final response = await Api2.getCartOrder(Api.token);
      if (response.statusCode == 200) {
        print("hello response ::  ${response.body}");
        final getCartModel =
        GetCartModel.fromJson(json.decode(response.body));
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
    service = false;

    getCartModel().then((cartModel) {
      setState(() {
        _getCartModel = cartModel;
        service = true;
        currentQuantity = widget.quantity;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        centerTitle: true,
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(HomePage()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: service ? _getCartModel.data.isNotEmpty ? ListView.builder(
                itemCount: _getCartModel.data.length,
                itemBuilder: (context, index) {
                  final data = _getCartModel.data[index];
                  final product = data.products;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: 100,
                                width: 100,
                                image: NetworkImage(
                                    baseImageUrl + product.image
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              _getCartModel.data.removeAt(index);
                                            });
                                            // Remove item from cart
                                            await deleteCart(product.id);
                                            // Retrieve updated cart data
                                            getCartModel().then((cartModel) {
                                              setState(() {
                                                _getCartModel = cartModel;
                                                service = true;
                                              });
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Price: " + product.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: kBlueColor,
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (currentQuantity > 1) {
                                                        currentQuantity--;
                                                        product.price -= product.unitPrice;
                                                      } else {
                                                        print("You can't decrease less than 1");
                                                      }
                                                    });
                                                  },
                                                  child: Icon(Icons.remove, color: Colors.black),
                                                ),
                                                Text(
                                                  "$currentQuantity",
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      currentQuantity++;
                                                      product.price += product.unitPrice;
                                                    });
                                                  },
                                                  child: Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                  );
                },
              )
                  : Text('No items in the cart :(',
              style: TextStyle(
                color: Colors.transparent,
              ),
              ) : CircleProgressStyle(),
            ),
            TotalCalculationWidget(),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              child: Container(
                color: kBlueColor,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Choose a payment method ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PaymentMethodWidget(),
            SizedBox(height: 5,),
            PaymentMethodPayPal(),
            SizedBox(height: 5,),
            VisaCardUI(),
          ],

        ),
      ),
    );
  }
}