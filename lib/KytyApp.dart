import 'package:flutter/material.dart';
import 'Main/HomeView.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/PerfilView.dart';
import 'OnBoarding/RegisterView.dart';
import 'Splash/SplashView.dart';

class KytyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp=MaterialApp(title: "KyTy Miau!",
      routes: {
        '/loginview':(context) => LoginView(),
        '/registerview':(context) => RegisterView(),
        '/homeview':(context)=> HomeView(),
        '/splashview':(context)=> SplashView(),
        '/perfilview':(context)=> PerfilView(),
      },
      initialRoute: '/perfilview',
    );

    return materialApp;
  }

}