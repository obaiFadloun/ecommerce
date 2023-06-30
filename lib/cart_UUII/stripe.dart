import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_online_1/constans/CircleProg.dart';
import '../constans/constans.dart';
import '../bitcoin/UI.dart';

class PaymentMethodPayPal extends StatefulWidget {
  @override
  State<PaymentMethodPayPal> createState() => _PaymentMethodPayPalState();
}
const ImagePayPal = "assets/images/paypal.jpg";

class _PaymentMethodPayPalState extends State<PaymentMethodPayPal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFfae3e2).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: 10,
                right: 30,
                top: 10,
                bottom: 10
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: ()=> Get.to(PayPalPaymentUI()),
                    child: Image.network(ImagePayPal,

                    ),
                  ),
                ),
                Text(
                  "PayPal Card",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3a3a3b),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PayPalPaymentUI extends StatefulWidget {

  @override
  State<PayPalPaymentUI> createState() => _PayPalPaymentUIState();
}

class _PayPalPaymentUIState extends State<PayPalPaymentUI> {
  TextEditingController bitcoinAddressController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  void _loadPage() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  void showDialogWithDelay(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });

    AwesomeDialog(
      context: context,
      dialogBorderRadius: BorderRadius.circular(10),
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'Payment Successful',
      desc: 'Your payment was successful.',
      btnOkOnPress: () {},
    ).show();
  }

  @override
  void dispose() {
    bitcoinAddressController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.paypal_sharp,
            color: Colors.black,
          ),
          backgroundColor: kBlueColor,
          centerTitle: true,
          title: Text(
            'PayPal Payment',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body:
        isLoading
            ? Center(
          child: CircleProgressStyle(),
        )
            : Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  ImagePayPal,
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'PayPal Card',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Payment Details: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'price after conversion to dollar \$  is : 447\$',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlueColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
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
                                colors: const [Colors.black12, Colors.black54],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 1.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter PayPal number';
                        }
                        if (!RegExp("^[0-9]").hasMatch(value)) {
                          return 'Please enter a PayPal number';
                        }
                        return null;
                      },
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
                          Icons.mail,
                          color: kBlueColor,
                          size: 20,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        labelStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 20,
                        ),
                        labelText: "Enter your email  ",
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your Expiration Card ';
                        }
                        if (!RegExp("^[0-9]").hasMatch(value)) {
                          return 'Please enter a valid BitCoin number';
                        }
                        return null;
                      },
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
                          Icons.password,
                          color: kBlueColor,
                          size: 20,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        labelStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 20,
                        ),
                        labelText: "Enter your password",
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          showDialogWithDelay(context);
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          color: kBlueColor,
                          child: isLoading
                              ? Center(
                            child: Container(
                                color: kBlueColor,
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                          )
                              : Center(
                            child: Text(
                              'Make Payment',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
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
        ),
      );
  }
}

