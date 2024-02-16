import 'package:flutter/cupertino.dart';

class Utils {
  static late double screenHeight;
  static late double screenWidth;

  static void initScreenSize (BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    screenHeight =  size.height;
    screenWidth =  size.width;
  }
}