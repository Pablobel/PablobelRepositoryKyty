import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom/KTTextField.dart';
import '../FirestoreObjects/FBUsuario.dart';

class PerfilView extends StatelessWidget {
  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecApellidos = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;

  void onClickAceptar() async {
    FBUsuario usuario =
        new FBUsuario(nombre: tecNombre.text, apellidos: tecApellidos.text);
    /*final usuario = <String, dynamic>{
      "nombre": tecNombre.text,
      "apellidos": tecApellidos.text
    };*/

    String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUsuario).set(usuario.toFirestore());

    Navigator.of(_context).popAndPushNamed("/homeview");
  }

  void onClickCancelar() {}

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
          shadowColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 500, minHeight: 700, maxWidth: 1000, maxHeight: 1400),
            child: Column(
              children: [
                KTTextField(tecController: tecNombre, sHint: "Nombre"),
                KTTextField(tecController: tecApellidos, sHint: "Apellidos"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onClickAceptar,
                      child: Text("Aceptar"),
                    ),
                    TextButton(
                      onPressed: onClickCancelar,
                      child: Text("Cancelar"),
                    )
                  ],
                )
              ],
            )));
  }
}
