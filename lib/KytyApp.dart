import 'package:flutter/material.dart';
import 'package:kytypablo/Main/ArticuloView.dart';
import 'package:kytypablo/Main/CategoriasView.dart';
import 'package:kytypablo/Main/MasterCategoriasView.dart';
import 'package:kytypablo/Main/MasterHomeView.dart';
import 'Main/CreacionArticuloView.dart';
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
        '/articuloview':(context)=> ArticuloView(),
        '/creacionarticuloview':(context)=> CreacionArticuloView(),
        '/categoriasview':(context)=> CategoriasView(),
        '/masterhomeview':(context)=> MasterHomeView(),
        '/mastercategoriasview':(context)=> MasterCategoriasView(),
      },
      initialRoute: '/categoriasview',
    );

    return materialApp;
  }

}