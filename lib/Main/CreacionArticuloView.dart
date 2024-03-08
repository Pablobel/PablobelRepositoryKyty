import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/FirestoreObjects/FBPost.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';

import '../Custom/KTTextField.dart';

class CreacionArticuloView extends StatelessWidget {
  TextEditingController titulo = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();


  @override
  Widget build(BuildContext cotext) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DataHolder().nombre),
        ),
        body: Column(
          children: [
            KTTextField(tecController: titulo, sHint: 'Escribe título'),
            KTTextField(tecController: descripcion, sHint: 'Decripción'),
            KTTextField(tecController: precio, sHint: '0.0'),
            Image.asset("resources/cambiame1.png", width: 30, height: 45),
            TextButton(
                onPressed: () {
                  FBPost nuevoArticulo = new FBPost(
                      nombre: titulo.text,
                      descripcion: descripcion.text,
                      precio: double.parse(precio.text));

                  DataHolder().aniadirArticuloEnFB(nuevoArticulo);
                },
                child: Text("Vender"))
          ],
        ));
  }
}
