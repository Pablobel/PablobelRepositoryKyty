import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kytypablo/FirestoreObjects/FBPost.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';
import '../Custom/KTTextField.dart';

class CreacionArticuloView extends StatefulWidget {
  @override
  State<CreacionArticuloView> createState() => _CreacionArticuloViewState();
}

class _CreacionArticuloViewState extends State<CreacionArticuloView> {
  final List<String> categorias = [
    "Comics",
    "Tomos",
    "Magic",
    "Yu-Gi-Oh",
    "Juegos Retro"
  ];
  TextEditingController titulo = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();
  int categoria = DataHolder().categoria;
  ImagePicker _picker = ImagePicker();
  Uint8List? _imagePreview;
  late String urlImagen;

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
            KTTextField(tecController: titulo, sHint: 'Título',rutaImagen: "resources/tienda.png"),
            KTTextField(tecController: descripcion, sHint: 'Descripción',rutaImagen: "resources/tienda.png"),
            KTTextField(tecController: precio, sHint: 'Precio',rutaImagen: "resources/tienda.png"),
            _imagePreview != null
                ? Image.memory(_imagePreview!, width: 100, height: 100)
                : Image.asset('resources/tienda.png',
                    width: 100, height: 100),
            Row(children: [
              TextButton(onPressed: onGalleryClicked, child: Text("Galería")),
              TextButton(onPressed: onCameraClicked, child: Text("Cámara"))
            ]),
            TextButton(
                onPressed: () {
                  subirArchivo();

                },
                child: Text("Vender"))
          ],
        ));
  }

  void subirArchivo() async {
    final storageRef = FirebaseStorage.instance.ref();
    final metadata = SettableMetadata(contentType:"image/jpeg");
    final rutaAFicheroEnNube = storageRef.child(categorias[categoria] +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".jpg");
    if (_imagePreview != null) {
      await rutaAFicheroEnNube.putData(_imagePreview!,metadata);
      urlImagen = await rutaAFicheroEnNube.getDownloadURL();
      FBPost nuevoArticulo = new FBPost(
          nombre: titulo.text,
          descripcion: descripcion.text,
          precio: double.parse(precio.text),
          urlImagen: urlImagen);
      DataHolder().aniadirArticuloEnFB(nuevoArticulo,categorias[categoria]);
    } else {
      print("No hay imagen para subir.");
    }
  }
}
