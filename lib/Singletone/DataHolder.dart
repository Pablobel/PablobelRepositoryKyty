import 'package:cloud_firestore/cloud_firestore.dart';

import '../FirestoreObjects/FBPost.dart';

class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal();

  String nombre = "Título DataHolder";
  late FBPost selectedPost;
  late int categoria;
  FirebaseFirestore db = FirebaseFirestore.instance;

  DataHolder._internal() {}

  factory DataHolder() {
    return _dataHolder;
  }

  void aniadirArticuloEnFB(FBPost nuevoArticulo) {
    CollectionReference<FBPost> postRef = db
        .collection("Articulos")
        .withConverter(
            fromFirestore: FBPost.fromFirestore,
            toFirestore: (FBPost post, _) => post.toFirestore());

    postRef.add(nuevoArticulo);
  }
}
