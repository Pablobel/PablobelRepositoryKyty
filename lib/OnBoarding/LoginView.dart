import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/Custom/KTTextField.dart';

import '../FirestoreObjects/FBUsuario.dart';

class LoginView extends StatelessWidget {
  late BuildContext _context;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  String uidMaster = "qhM2QOZ8EbXMIZofeFGXT2AyUa13";

  void onClickRegistrar() {
    Navigator.of(_context).pushNamed("/registerview");
  }

  void onClickAceptar() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text, password: passwordController.text);
      String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
      /*DocumentSnapshot<Map<String, dynamic>> datos =
          await db.collection("Usuarios").doc(uidUsuario).get();*/
      DocumentReference<FBUsuario> ref =
          db.collection("Usuarios").doc(uidUsuario).withConverter(
                fromFirestore: FBUsuario.fromFirestore,
                toFirestore: (FBUsuario usuario, _) => usuario.toFirestore(),
              );
      DocumentSnapshot<FBUsuario> docSnap = await ref.get();
      FBUsuario? usuario = docSnap.data();

      if (usuario != null) {
        if (uidUsuario == uidMaster) {
          Navigator.of(_context).popAndPushNamed("/mastercategoriasview");
          print("soy master");
        } else {
          Navigator.of(_context).popAndPushNamed("/categoriasview");
        }
      } else {
        Navigator.of(_context).popAndPushNamed("/perfilview");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    Column columna = Column(
      children: [
        Text("Kyty Login", style: TextStyle(fontSize: 25)),
        KTTextField(tecController: userNameController, sHint: 'Usuario'),
        KTTextField(
            tecController: passwordController,
            sHint: 'Contraseña',
            esContrasenia: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onClickAceptar,
              child: Text("Aceptar"),
            ),
            TextButton(
              onPressed: onClickRegistrar,
              child: Text("Registrar"),
            )
          ],
        )
      ],
    );
    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
    );
    Scaffold scaf = Scaffold(
      body: columna,
      appBar: appBar,
    );

    return scaf;
  }
}
