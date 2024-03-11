import 'package:cloud_firestore/cloud_firestore.dart';

class FBUsuario {
  final String nombre;
  final String apellidos;
  final String direccion;
  final double latitud;
  final double longitud;

  FBUsuario(
      {required this.nombre,
      required this.apellidos,
      required this.direccion,
      required this.latitud,
      required this.longitud});

  factory FBUsuario.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FBUsuario(
        nombre: data?['nombre'] != null ? data!['nombre'] : "",
        apellidos: data?['apellidos'] != null ? data!["apellidos"] : "",
        direccion: data?['direccion'] != null ? data!['direccion'] : "",
        longitud: data?['longitud'] != null ? data!['longitud'] : 0,
        latitud: data?['latitud'] != null ? data!['latitud'] : 0);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos,
      if (direccion != null) "direccion": direccion,
      if (longitud != null) "longitud": longitud,
      if (latitud != null) "latitud": latitud,
    };
  }
}
