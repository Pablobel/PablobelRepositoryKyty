import 'package:cloud_firestore/cloud_firestore.dart';

class FBPost {
  final String nombre;
  final String descripcion;
  final double precio;
  final String urlImagen;

  FBPost({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.urlImagen,
  });

  factory FBPost.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FBPost(
        nombre: data?['nombre'] != null ? data!['nombre'] : "",
        descripcion: data?['descripcion'] != null ? data!['descripcion'] : "",
        precio: data?['precio'] != null ? data!['precio'] : 0.0,
        urlImagen: data?['urlImagen'] != null ? data!['urlImagen'] : "");
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (descripcion != null) "descripcion": descripcion,
      if (precio != null) "precio": precio,
      if (urlImagen != null) "urlImagen": urlImagen,
    };
  }
}
