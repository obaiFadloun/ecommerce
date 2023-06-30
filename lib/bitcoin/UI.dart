import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_store_online_1/constans/CircleProg.dart';

class BitcoinPaymentScreen extends StatefulWidget {
  @override
  _BitcoinPaymentScreenState createState() => _BitcoinPaymentScreenState();
}

class _BitcoinPaymentScreenState extends State<BitcoinPaymentScreen> {
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
    double priceInBTC = 0.04761825;
    String formattedPrice = priceInBTC.toStringAsFixed(8);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.currency_bitcoin,
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'Bitcoin Payment',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFvVnVFKSW_7vrtBI1_9UfnMJQf_kkqFJI8Q&usqp=CAU',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Credit/Bitcoin Card',
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
              'Price after conversion to crypto: $formattedPrice BTC',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(height: 16.0),
            Center(
              child: QrImage(
                data: bitcoinAddressController.text,
                version: QrVersions.auto,
                size: 200.0,
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
                              colors: const [
                                Colors.black12,
                                Colors.black54
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          width: 100.0,
                          height: 1.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0),
                          child: Text(
                            "Or",
                            style: TextStyle(
                              color: Color(0xFF2c2b2b),
                              fontSize: 16.0,
                              fontFamily: "WorkSansMedium",
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: const [
                                Colors.black54,
                                Colors.black12
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          width: 100.0,
                          height: 1.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your BitCoin number';
                      }
                      if (!RegExp("^[0-9]").hasMatch(value)) {
                        return 'Please enter a valid BitCoin number';
                      }
                      return null;
                    },
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.currency_bitcoin,
                        color: Colors.orange,
                        size: 20,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      labelStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 20,
                      ),
                      labelText: "Crypto Wallet",
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        showDialogWithDelay(context);
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        color: Colors.orange,
                        child: isLoading
                            ? Center(
                          child: Container(
                              color: Colors.orange,
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
