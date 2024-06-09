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

  void onClickCancelar() {
    Navigator.of(_context).popAndPushNamed("/loginview");
  }

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
        body:
             Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Añade separación entre el borde y el texto
                  decoration: BoxDecoration(
                    color: Colors.tealAccent, // Fondo blanco
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                    border: Border.all(color: Colors.indigo, width: 2), // Borde negro
                  ),
                  child: Text(
                    "¡Dinos algo sobre ti!",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black, // Color del texto
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 75, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Añade separación entre el borde y el texto
                  decoration: BoxDecoration(
                    color: Colors.yellow, // Fondo blanco
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                    border: Border.all(color: Colors.red, width: 2), // Borde negro
                  ),
                  child: Text(
                    "Ahora puedes dejar los campos sin rellenar. Pero ten en cuenta que si deseas comprar algún artículo en algún momento "
                        "serán necesarios los siguientes datos para que podamos enviarte el artículo. Si deseas hacerlo más adelante no olvides ir a tu perfil y rellenar "
                        "los campos que falten.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black, // Color del texto
                    ),
                  ),
                ),
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
                        onPressed: onClickCancelar,
                        child: Text(
                          "CANCELAR",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
    );
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
