
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

  dynamic customSnackbar(title, message, type ){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 3),
    backgroundColor: type == "error"?Color(0xFFf7418c):Colors.green,
    colorText: Colors.white,
  );
}


dynamic CustomeSnackBarTrue(title, message, type ){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 1),
    backgroundColor: type == "True"?Color(0xFF40BAD5):Color(0xFF40BAD5),
    colorText: Colors.yellow,
  );
}
dynamic CustomSignUPSucc (title, message, type ){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 1),
    backgroundColor: type == "True"?Color(0xFFf7418c):Color(0xFFf7418c),
    colorText: Colors.white,
  );
}dynamic CustomSignUPFalse (title, message, type ){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 1),
    backgroundColor: type == "False"?Color(0xFFf7418c):Color(0xFFf7418c),
    colorText: Colors.white,
  );
}