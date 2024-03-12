import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/Main/ArticuloView.dart';
import 'package:kytypablo/Main/CategoriasView.dart';
import 'package:kytypablo/Main/MasterCategoriasView.dart';
import 'package:kytypablo/Main/MasterHomeView.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';
import 'Main/CreacionArticuloView.dart';
import 'Main/HomeView.dart';
import 'Main/TemperaturasView.dart';
import 'OnBoarding/Android/LoginViewMobile.dart';
import 'OnBoarding/LoginView.dart';
import 'OnBoarding/PerfilView.dart';
import 'OnBoarding/PhoneView.dart';
import 'OnBoarding/RegisterView.dart';
import 'Splash/SplashView.dart';

class KytyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataHolder().initPlatformAdmin(context);
    MaterialApp materialApp;
    if (kIsWeb) {
      materialApp = MaterialApp(
        title: "Frikeando",
        routes: {
          '/loginview': (context) => LoginView(),
          '/registerview': (context) => RegisterView(),
          '/homeview': (context) => HomeView(),
          '/splashview': (context) => SplashView(),
          '/perfilview': (context) => PerfilView(),
          '/articuloview': (context) => ArticuloView(),
          '/creacionarticuloview': (context) => CreacionArticuloView(),
          '/categoriasview': (context) => CategoriasView(),
          '/masterhomeview': (context) => MasterHomeView(),
          '/mastercategoriasview': (context) => MasterCategoriasView(),
          '/phoneview': (context) => PhoneView(),
          '/temperaturasview': (context) => TemperaturasView(),
        },
        initialRoute: '/splashview',
      );
    } else {
      materialApp = MaterialApp(
        title: "Frikeando",
        routes: {
          '/loginviewmobile': (context) => LoginViewMobile(),
        },
        initialRoute: '/loginviewmobile',
      );
    }
    return materialApp;
  }
}
