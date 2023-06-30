import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_store_online_1/cart_UUII/cartScreen.dart';
import 'package:smart_store_online_1/constans/colors.dart';
import 'package:smart_store_online_1/second_screens/clothes_types.dart';
import '../constans/constans.dart';
import '../payment/details_cart.dart';


class DetailsScreenPopular extends StatefulWidget {
  const DetailsScreenPopular({Key key,  product}) : super(key: key);

  @override
  State<DetailsScreenPopular> createState() => _DetailsScreenPopularState();
}
class _DetailsScreenPopularState extends State<DetailsScreenPopular> {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Item",style: TextStyle(color: Colors.black,
        ),
        ),
        backgroundColor: kBlueColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(ClothesScreen()),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.business_center,
                color: Colors.black,
              ),
              onPressed: () {
              })
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body : SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
          ),
          padding: const EdgeInsets.only(
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
                  image: AssetImage("assets/images/clothes/jakeet.png"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                elevation: 1,
                margin: const EdgeInsets.all(5),
              ),
              // const FoodTitleWidget(
              //     productName: "Jacket waterprof",
              //     productPrice: "150000 SYP",
              //     productHost: "E-Smart-store"),
              const Counter(),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const  [
                  Text("Size",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              const DetailScreenSelectSize(),
              const SizedBox(
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
                ],
              ),
              SizedBox(
                height: 5,

              ),
              Row(
                children: [
                  ColorDot(
                    color: Colors.amberAccent,
                    isActive: false,
                    press: () {
                      // Handle the click event here
                    },
                  ),
                  ColorDot(
                    color: Colors.red,
                    isActive: false,
                    press: () {
                      // Handle the click event here
                    },
                  ),
                  ColorDot(
                    color: Colors.black,
                    isActive: false,
                    press: () {
                    },
                  ),
                  ColorDot(
                    color: Colors.green,
                    isActive: false,
                    press: () {
                    },
                  ),
              SizedBox(height: 30,),
              const AddToCartMenu(),
            ],
          ),
          ],
        ),
      ),
      ),
    );
  }
}
class FoodTitleWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productHost;

  const FoodTitleWidget({
    Key key,
    @required this.productName,
    @required this.productPrice,
    @required this.productHost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              productName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              productPrice,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            const Text(
              "by",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFa9a9a9),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              productHost,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1f1f1f),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
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
    this.min = 1,
    this.max = 15,
  }) : super(key: key);

  final int min;
  final int max;

  final String title;
  final int value;
  final void Function() onIncreaseButtonPressed;
  final void Function() onDecreaseButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: onDecreaseButtonPressed,
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
                "2",
                style: kNumberStyle,
              ),
              SizedBox(
                width: 12,
              ),
              RawMaterialButton(
                onPressed: onIncreaseButtonPressed,
                child: const Icon(Icons.add),
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
    return SizedBox(
      height: 35,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizesList.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = i;
              });
            },
            child: Container(
              // margin: const EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(defaultPadding / 4),
              height: 70,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentSelected == i
                    ? AppColors.darkGrey
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
                sizesList[i].title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: currentSelected == i ? Colors.white : kSecondaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}
int counter = 1;

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MainContainer(
            color: kBlueColor,
            child: CounterWidget(
              max: 10,
              min: 0,
              title: "",
              value: counter,
              onIncreaseButtonPressed: () {
                setState(() {
                  counter++;
                });
              },
              onDecreaseButtonPressed: () {
                setState(() {
                  counter--;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
class AddToCartMenu extends StatelessWidget   {
  const AddToCartMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        verticalDirection: VerticalDirection.down,

        children: <Widget>[

          InkWell(
            onTap: ()=> CartScreen(),
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
    );
  }
}

