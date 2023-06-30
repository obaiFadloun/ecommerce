// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:smart_store_online_1/details_screen/material_button.dart';
// import 'package:smart_store_online_1/payment/details_cart.dart';
// import 'package:smart_store_online_1/second_screens/clothes_types.dart';
// import '../constans/constans.dart';
// import 'package:badges/badges.dart' as badges;
//
// import '../tester/cart_teest.dart';
//
//
// class DetailsClothesScreen extends StatefulWidget{
//   final String ImageNet;
//   final String price;
//   final String Text;
//   const DetailsClothesScreen({Key key, this.ImageNet, this.price, this.Text, }) : super(key: key);
//   @override
//   State<DetailsClothesScreen> createState() => _DetailsClothesScreenState();
// }
// class _DetailsClothesScreenState extends State<DetailsClothesScreen> {
//   List<Color> mycolors = <Color>[
//     Colors.white,
//     Colors.blue,
//     Colors.green,
//     Colors.purple,
//     Colors.orange,
//     Colors.indigo,
//   ];
//
//   // final List<Item> items = [
//   //   Item(title: 'laptop ', price: 500.0),
//   //   Item(title: 'iphone x ', price: 400.0),
//   //   Item(title: 'keyboard ', price: 40.0),
//   // ];
//   Color primaryColor = Colors.red;
//   int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Cart>(builder: (context, cart, child) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("Your Item", style: TextStyle(color: Colors.black)),
//           backgroundColor: kBlueColor,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//             onPressed: () => Get.to(ClothesScreen()),
//           ),
//           actions: <Widget>[
//             badges.Badge(
//               position: badges.BadgePosition.topEnd(top: -10, end: -12),
//               showBadge: true,
//               ignorePointer: false,
//               onTap: () {},
//               badgeContent: Text(cart.count.toString(),
//                 style: TextStyle(
//                     fontSize: 8,
//                     color: Colors.white
//                 ),),
//               badgeAnimation: badges.BadgeAnimation.rotation(
//                 animationDuration: Duration(seconds: 1),
//                 colorChangeAnimationDuration: Duration(seconds: 1),
//                 loopAnimation: false,
//                 curve: Curves.fastOutSlowIn,
//                 colorChangeAnimationCurve: Curves.easeInCubic,
//               ),
//               badgeStyle: badges.BadgeStyle(
//                 shape: badges.BadgeShape.square,
//                 badgeColor: Colors.blue,
//                 padding: EdgeInsets.all(5),
//                 borderRadius: BorderRadius.circular(4),
//                 borderSide: BorderSide(color: Colors.white, width: 2),
//                 borderGradient: badges.BadgeGradient.linear(
//                     colors: [Colors.red, Colors.black]),
//                 badgeGradient: badges.BadgeGradient.linear(
//                   colors: [Colors.blue, Colors.yellow],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 elevation: 0,
//               ),
//               child: Icon(Icons.shopping_cart_rounded,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//
//           systemOverlayStyle: SystemUiOverlayStyle.dark,
//         ),
//         body: MaterialButton(
//           textColor: Colors.yellow,
//           onPressed: () {
//
//             cart.add(item[index]);
//           },
//           child: Text("widget.Text"),
//           // items[index].price.toString()),
//           // trailing: Icon(Icons.add),
//           // onTap: () {
//           //   cart.add(items[index]);
//           // },
//         ),
//       );
//     }
//     );
//   }
// }
//
//
// Text(cart.count.toString())
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Your Item", style: TextStyle(color: Colors.black)),
//         backgroundColor: kBlueColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () => Get.to(ClothesScreen()),
//         ),
//         actions: <Widget>[
//           badges.Badge(
//             position: badges.BadgePosition.topEnd(top: -10, end: -12),
//             showBadge: true,
//             ignorePointer: false,
//             onTap: () {},
//             badgeContent:Text("0",style: TextStyle(
//                 fontSize: 8,
//                 color: Colors.white
//             ),),
//             badgeAnimation: badges.BadgeAnimation.rotation(
//               animationDuration: Duration(seconds: 1),
//               colorChangeAnimationDuration: Duration(seconds: 1),
//               loopAnimation: false,
//               curve: Curves.fastOutSlowIn,
//               colorChangeAnimationCurve: Curves.easeInCubic,
//             ),
//             badgeStyle: badges.BadgeStyle(
//               shape: badges.BadgeShape.square,
//               badgeColor: Colors.blue,
//               padding: EdgeInsets.all(5),
//               borderRadius: BorderRadius.circular(4),
//               borderSide: BorderSide(color: Colors.white, width: 2),
//               borderGradient: badges.BadgeGradient.linear(
//                   colors: [Colors.red, Colors.black]),
//               badgeGradient: badges.BadgeGradient.linear(
//                 colors: [Colors.blue, Colors.yellow],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               elevation: 0,
//             ),
//             child: Icon(Icons.shopping_cart_rounded,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(
//             left: 15,
//             right: 15,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ColorFiltered(
//                 colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
//                 child: Card(
//                   semanticContainer: true,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: Image(
//                     width: 260,
//                     height: 260,
//                     image: NetworkImage(widget.ImageNet),
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(3.0),
//                   ),
//                   elevation: 1,
//                   margin: const EdgeInsets.all(5),
//                 ),
//
//               ),
//               Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         widget.Text,
//                         style: const TextStyle(
//                             fontSize: 20,
//                             color: Color(0xFF3a3a3b),
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         widget.price,
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Color(0xFF3a3a3b),
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 children: const <Widget>[
//                   Text(
//                     "by",
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFFa9a9a9),
//                         fontWeight: FontWeight.w400),
//                   ),
//                   Text(
//                     "ZARA",
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFF1f1f1f),
//                         fontWeight: FontWeight.w400),
//                   ),
//
//                 ],
//               ),
//               Counter(),
//               const SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text("Size",
//                     style: TextStyle(
//                       fontSize: 17,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 5,),
//               DetailScreenSelectSize(),
//               SizedBox(
//                 height: 25,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:  [
//                   Text("Colors",
//                     style: TextStyle(
//                       fontSize: 17,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                      height: 50,
//                      child: SingleChildScrollView(
//                        scrollDirection: Axis.horizontal,
//                        child: Row(
//                          mainAxisSize: MainAxisSize.min,
//                          children: [
//                            for (var i = 0; i < 6; i++) buildIconBtn(mycolors[i])
//                          ],
//                        ),
//                      ),
//                    ),
//               ),
//               SizedBox(height: 30,),
//               Center(
//                 child: Column(
//                   verticalDirection: VerticalDirection.down,
//                   children: <Widget>[
//                     // InkWell(
//                     // onTap:  () => ),
//                     Container(
//                       width: 200.0,
//                       height: 45.0,
//                       decoration: BoxDecoration(
//                         color: kBlueColor,
//                         border: Border.all(color: Colors.white, width: 2.0),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: MaterialButton(
//                         onPressed: (){
//                           // cart.add(items[index]);
//                         },
//                         child: const Center(
//                           child: Text(
//                             'Add To Bag',
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//       ),
//
//     );
//   }
//   Widget buildIconBtn(Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             primaryColor = color;
//           });
//         },
//         child: Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: color,
//           ),
//           child: primaryColor == color
//               ? const Icon(
//             Icons.check,
//             color: Colors.white,
//             size: 20,
//           )
//               : null,
//         ),
//       ),
//     );
//   }
// }
//
// class MainContainer extends StatelessWidget {
//   const MainContainer({
//     Key key,
//     this.child,
//     this.color,
//     this.onTap,
//   }) : super(key: key);
//   final Widget child;
//   final Color color;
//   final void Function() onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: SizedBox(
//         width: double.infinity,
//         child: child,
//       ),
//     );
//   }
// }
// class CounterWidget extends StatelessWidget {
//   const CounterWidget({
//     Key key,
//     this.title,
//     this.value,
//     this.onIncreaseButtonPressed,
//     this.onDecreaseButtonPressed,
//     this.min,
//     this.max,
//   }) : super(key: key);
//   final int min;
//   final int max;
//   final String title;
//   final int value;
//   final void Function() onIncreaseButtonPressed;
//   final void Function() onDecreaseButtonPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RawMaterialButton(
//                 onPressed: onDecreaseButtonPressed,
//                 child: const Icon(Icons.remove),
//                 fillColor: kBlueColor,
//                 shape: const CircleBorder(),
//                 constraints: const BoxConstraints.tightFor(
//                   width: 38,
//                   height: 38,
//                 ),
//                 elevation: 3,
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               Text(
//                 title,
//                 style: kTextStyle1,
//               ),
//               Text(
//                 "$value",
//                 style: kNumberStyle,
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               RawMaterialButton(
//                 onPressed: onIncreaseButtonPressed,
//                 child: const Icon(Icons.add,
//                 ),
//                 fillColor: kBlueColor,
//                 shape: const CircleBorder(),
//                 constraints: const BoxConstraints.tightFor(
//                   width: 38,
//                   height: 38,
//                 ),
//                 elevation: 3,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// class SizeModel {
//   String title;
//   SizeModel({ this.title});
// }
// class DetailScreenSelectSize extends StatefulWidget {
//   const DetailScreenSelectSize({Key key}) : super(key: key);
//
//   @override
//   State<DetailScreenSelectSize> createState() => _DetailScreenSelectSizeState();
// }
// class _DetailScreenSelectSizeState extends State<DetailScreenSelectSize> {
//   int currentSelected = 2;
//   List<SizeModel> sizesList = [
//     SizeModel(title: 'M'),
//     SizeModel(title: 'L'),
//     SizeModel(title: 'XL'),
//     SizeModel(title: 'XXL'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 35,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: sizesList.length,
//         itemBuilder: (ctx, i) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 currentSelected = i;
//               });
//             },
//             child: Container(
//               // margin: const EdgeInsets.only(left: 10),
//               padding: EdgeInsets.all(defaultPadding / 4),
//               height: 70,
//               width: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: currentSelected == i
//                     ? AppColors.darkGrey
//                     : AppColors.darkWhite,
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.lightGrey.withOpacity(.7),
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 sizesList[i].title,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                   color: currentSelected == i ? Colors.white : kSecondaryColor,
//                 ),
//               ),
//
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// class Counter extends StatefulWidget {
//   const Counter({Key key}) : super(key: key);
//   @override
//   State<Counter> createState() => _CounterState();
// }
// int counter = 1;
// class _CounterState extends State<Counter> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: MainContainer(
//             color: kBlueColor,
//             child: CounterWidget(
//               title: "",
//               value: counter,
//               onIncreaseButtonPressed: () {
//                 if (counter >= 15){
//                   return;
//                 }
//                 setState(() {
//                   counter++;
//                 });
//               },
//               onDecreaseButtonPressed: () {
//                 if (counter <= 1){
//                   return;
//                 }
//                 setState(() {
//                   counter--;
//                 });
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }