import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kytypablo/FirestoreObjects/FBPost.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';
import '../Custom/KTTextField.dart';

class CreacionArticuloView extends StatefulWidget {
  @override
  State<CreacionArticuloView> createState() => _CreacionArticuloViewState();
}

class _CreacionArticuloViewState extends State<CreacionArticuloView> {
  TextEditingController titulo = TextEditingController();

  TextEditingController descripcion = TextEditingController();

  TextEditingController precio = TextEditingController();

  int categoria = DataHolder().categoria;

  ImagePicker _picker = ImagePicker();

  Uint8List? _imagePreview;

  void onGalleryClicked() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageData = await image.readAsBytes();
      setState(() {
        _imagePreview = imageData;
      });
    }
  }

  void onCameraClicked() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final imageData = await image.readAsBytes();
      setState(() {
        _imagePreview = imageData;
      });
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
            _imagePreview != null
                ? Image.memory(_imagePreview!, width: 100, height: 100)
                : Placeholder(),
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
