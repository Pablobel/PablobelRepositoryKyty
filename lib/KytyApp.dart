import 'package:flutter/material.dart';
import 'OnBoarding/LoginView.dart';

class KytyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp=MaterialApp(title: "KyTy Miau!",
      routes: {
        '/loginview':(context) => LoginView(),
      },
      initialRoute: '/loginview',
    );

    return materialApp;
  }

}