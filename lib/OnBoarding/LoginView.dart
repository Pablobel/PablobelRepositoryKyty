

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onClickRegistrar(){
    Navigator.of(_context).pushNamed("/registerview");
  }

  void onClickAceptar() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text
      );
      Navigator.of(_context).popAndPushNamed("/homeview");
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
    _context=context;
    Column columna = Column(children: [
      Text("Kyty Login",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          controller: userNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Usuario',
          ),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Contraseña',
          ),
          obscureText: true,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed:onClickAceptar, child: Text("Aceptar"),),
          TextButton(onPressed: onClickRegistrar , child: Text("Registrar"),)
        ],)
    ],);
    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
    );
    Scaffold scaf=Scaffold(body: columna,
      appBar: appBar,);

    return scaf;

  }

}