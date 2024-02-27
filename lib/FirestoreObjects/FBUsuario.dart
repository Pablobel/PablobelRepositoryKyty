import 'package:cloud_firestore/cloud_firestore.dart';

class FBUsuario {
  final String nombre;
  final String apellidos;

  FBUsuario({
    required this.nombre,
    required this.apellidos,
  });

  factory FBUsuario.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FBUsuario(nombre: data?['nombre'], apellidos: data?['apellidos']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nombre != null) "nombre": nombre,
      if (apellidos != null) "apellidos": apellidos
    };
  }
}
