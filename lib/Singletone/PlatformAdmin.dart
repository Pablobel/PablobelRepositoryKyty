import 'package:flutter/cupertino.dart';

class PlatformAdmin{

  BuildContext context;

  PlatformAdmin({required this.context});

  double getScreenWidth(){
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  double getScreenHeight(){
    double height = MediaQuery.of(context).size.width;
    return height;
  }

}