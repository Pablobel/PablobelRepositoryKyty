import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';
import '../Custom/KTTextField.dart';
import '../FirestoreObjects/FBUsuario.dart';

class PerfilView extends StatelessWidget {
  TextEditingController tecNombre = TextEditingController();
  TextEditingController tecApellidos = TextEditingController();
  TextEditingController tecCodigoPostal = TextEditingController();
  TextEditingController tecPoblacion = TextEditingController();
  TextEditingController tecCiudad = TextEditingController();
  TextEditingController tecCalle = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;
  double longitud = 0;
  double latitud = 0;

  void onClickAceptar() async {
    bool calcularCoordenadas = await preguntaCoordenadas();
    if(calcularCoordenadas){
      Position pos = await DataHolder().geolocAdmin.determinePosition();
      latitud = pos.latitude;
      longitud = pos.longitude;
    }
    FBUsuario usuario = new FBUsuario(
        nombre: tecNombre.text,
        apellidos: tecApellidos.text,
        codigoPostal: tecCodigoPostal.text,
        poblacion: tecPoblacion.text,
        ciudad: tecCiudad.text,
        calle: tecCalle.text,
        latitud: latitud,
        longitud: longitud);

    /*final usuario = <String, dynamic>{
      "nombre": tecNombre.text,
      "apellidos": tecApellidos.text
    };*/

    String uidUsuario = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUsuario).set(usuario.toFirestore());

    Navigator.of(_context).popAndPushNamed("/categoriasview");
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
                Text("Dinos algo sobre ti", style: TextStyle(fontSize: 25)),
                KTTextField(
                    tecController: tecNombre,
                    sHint: "Nombre",
                    rutaImagen: "resources/tienda.png"),
                KTTextField(
                    tecController: tecApellidos,
                    sHint: "Apellidos",
                    rutaImagen: "resources/tienda.png"),
                KTTextField(
                    tecController: tecCodigoPostal,
                    sHint: "Código Postal",
                    rutaImagen: "resources/tienda.png"),
                KTTextField(
                    tecController: tecPoblacion,
                    sHint: "Población",
                    rutaImagen: "resources/tienda.png"),
                KTTextField(
                    tecController: tecCiudad,
                    sHint: "Ciudad",
                    rutaImagen: "resources/tienda.png"),
                KTTextField(
                    tecController: tecCalle,
                    sHint: "Calle y número",
                    rutaImagen: "resources/tienda.png"),
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

  Future<bool> preguntaCoordenadas() async {
    bool resultado = await showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Compartir Ubicación"),
          content: Text("¿Desea compartir sus coordenadas también?"),
          actions: <Widget>[
            TextButton(
              child: Text("Rechazar"),
              onPressed: () => Navigator.of(context).pop(false), // Devuelve false
            ),
            TextButton(
              child: Text("Aceptar"),
              onPressed: () => Navigator.of(context).pop(true), // Devuelve true
            ),
          ],
        );
      },
    );
    return resultado ?? false; // Asegúrate de manejar el caso null (por ejemplo, si el diálogo se cierra de alguna otra manera)
  }
}
