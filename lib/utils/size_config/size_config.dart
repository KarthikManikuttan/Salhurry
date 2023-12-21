import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeH;
  static late double blockSizeV;
  static late double constSize;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeH = screenWidth / 100;
    blockSizeV = screenHeight / 100;
    constSize = (screenWidth + screenHeight) / 20;
  }
}
