import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  late BuildContext _context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  void checkSession() async {
    await Future.delayed(Duration(seconds: 5));
    if (FirebaseAuth.instance.currentUser != null){
      Navigator.of(_context).popAndPushNamed("/homeview");
    }
    else{
      Navigator.of(_context).popAndPushNamed("/loginview");
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    Column columna = Column(
      children: [
        Image.asset(
          "resources/cambiame1.png",
          width: 300,
          height: 150,
        ),
        CircularProgressIndicator()
      ],
    );

    //return Image.network("https://cdn.discordapp.com/attachments/1094893510609608764/1154156474763845703/yony44_logo_using_cat_ears_and_head_like_disney_symbol_happy_an_1fccd304-c37e-410f-a9bd-155c310e365a.png?ex=65e8d5fa&is=65d660fa&hm=b175fa097f6fb91c9c934125f13260ec643ed9304249b6aa1b77fbb86c0513ac&.png");
    //return Image.asset("resources/cambiame2.png");
    return columna;
  }
}
