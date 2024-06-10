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
    await Future.delayed(Duration(seconds: 3));
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "resources/tienda.png",
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
