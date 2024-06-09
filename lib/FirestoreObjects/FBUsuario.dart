import 'package:cloud_firestore/cloud_firestore.dart';

class FBUsuario {
  final String nombre;
  final String apellidos;
  final String codigoPostal;
  final String poblacion;
  final String ciudad;
  final String calle;
  final double latitud;
  final double longitud;

  FBUsuario(
      {required this.nombre,
      required this.apellidos,
      required this.codigoPostal,
        required this.poblacion,
        required this.ciudad,
        required this.calle,
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
        codigoPostal: data?['codigoPostal'] != null ? data!['codigoPostal'] : "",
        poblacion: data?['poblacion'] != null ? data!['poblacion'] : "",
        ciudad: data?['ciudad'] != null ? data!['ciudad'] : "",
        calle: data?['calle'] != null ? data!['calle'] : "",
        longitud: data?['longitud'] != null ? data!['longitud'] : 0,
        latitud: data?['latitud'] != null ? data!['latitud'] : 0);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos,
      if (codigoPostal != null) "codigoPostal": codigoPostal,
      if (poblacion != null) "poblacion": poblacion,
      if (ciudad != null) "ciudad": ciudad,
      if (calle != null) "calle": calle,
      if (longitud != null) "longitud": longitud,
      if (latitud != null) "latitud": latitud,
    };
  }
}
