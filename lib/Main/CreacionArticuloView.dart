import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kytypablo/FirestoreObjects/FBPost.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';

import '../Custom/KTTextField.dart';

class CreacionArticuloView extends StatelessWidget {
  TextEditingController titulo = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();
  int categoria = DataHolder().categoria;
  ImagePicker _picker = ImagePicker();
  String _imagePreview="resources/cambiame1.png";

  void onGalleryClicked() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(_imagePreview!=null){

    }
  }

  void onCameraClicked() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if(_imagePreview!=null){

    }
  }

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
            Image.asset(_imagePreview, width: 300, height: 450),
            Row(children: [
              TextButton(onPressed: onGalleryClicked, child: Text("Galería")),
              TextButton(onPressed: onCameraClicked, child: Text("Cámara"))
            ]),
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
