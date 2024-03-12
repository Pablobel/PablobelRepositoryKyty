import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/FirestoreObjects/FBUsuario.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String uidMaster = "qhM2QOZ8EbXMIZofeFGXT2AyUa13";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  void checkSession() async {
    await Future.delayed(Duration(seconds: 5));
    if (FirebaseAuth.instance.currentUser != null) {
      String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
      /*DocumentSnapshot<Map<String, dynamic>> datos =
          await db.collection("Usuarios").doc(uidUsuario).get();*/
      DocumentReference<FBUsuario> ref =
          db.collection("Usuarios").doc(uidUsuario).withConverter(
                fromFirestore: FBUsuario.fromFirestore,
                toFirestore: (FBUsuario usuario, _) => usuario.toFirestore(),
              );
      DocumentSnapshot<FBUsuario> docSnap = await ref.get();
      FBUsuario usuario = docSnap.data()!;

      if (usuario != null) {
        if (uidUsuario == uidMaster) {
          Navigator.of(context).popAndPushNamed("/mastercategoriasview");
          print("soy master");
        } else {
          Navigator.of(context).popAndPushNamed("/categoriasview");
        }
      } else {
        Navigator.of(context).popAndPushNamed("/perfilview");
      }
    } else {
      Navigator.of(context).popAndPushNamed("/loginview");
    }
  }

  @override
  Widget build(BuildContext context) {
    Column columna = Column(
      children: [
        Image.asset(
          "resources/tienda.png",
          width: DataHolder().platformAdmin.getScreenWidth()*0.4,
          height: DataHolder().platformAdmin.getScreenHeight()*0.4,
        ),
        CircularProgressIndicator()
      ],
    );

    //return Image.network("https://cdn.discordapp.com/attachments/1094893510609608764/1154156474763845703/yony44_logo_using_cat_ears_and_head_like_disney_symbol_happy_an_1fccd304-c37e-410f-a9bd-155c310e365a.png?ex=65e8d5fa&is=65d660fa&hm=b175fa097f6fb91c9c934125f13260ec643ed9304249b6aa1b77fbb86c0513ac&.png");
    //return Image.asset("resources/cambiame2.png");
    return columna;
  }
}
