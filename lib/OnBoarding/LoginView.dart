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
  String uidMaster = "i8Hc99Mx3BRJCQNcjq1WbWazSec2";

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('resources/tienda.png'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Añade separación entre el borde y el texto
                  decoration: BoxDecoration(
                    color: Colors.tealAccent, // Fondo blanco
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                    border: Border.all(color: Colors.black, width: 2), // Borde negro
                  ),
                  child: Text(
                    "¿Tienes una cuenta con nosotros?",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black, // Color del texto
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espaciado entre los elementos
                KTTextField(
                  tecController: userNameController,
                  sHint: 'Usuario',
                  rutaImagen: "resources/tienda.png",
                ),
                KTTextField(
                  tecController: passwordController,
                  sHint: 'Contraseña',
                  rutaImagen: "resources/tienda.png",
                  esContrasenia: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: TextButton(
                        onPressed: onClickAceptar,
                        child: Text(
                          "ACEPTAR",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Espacio entre los botones
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: TextButton(
                        onPressed: onClickRegistrar,
                        child: Text(
                          "REGISTRAR",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
