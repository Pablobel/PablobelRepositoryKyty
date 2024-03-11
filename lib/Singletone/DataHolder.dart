import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kytypablo/Singletone/GeolocAdmin.dart';
import '../FirestoreObjects/FBPost.dart';
import 'HttpAdmin.dart';

class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal();

  String nombre = "Título DataHolder";
  late FBPost selectedPost;
  late int categoria;
  FirebaseFirestore db = FirebaseFirestore.instance;
  HttpAdmin httpAdmin = HttpAdmin();
  GeolocAdmin geolocAdmin = GeolocAdmin();

  DataHolder._internal() {}

  factory DataHolder() {
    return _dataHolder;
  }

  void aniadirArticuloEnFB(FBPost nuevoArticulo, String categoria) {
    CollectionReference<FBPost> postRef = db
        .collection(categoria)
        .withConverter(
            fromFirestore: FBPost.fromFirestore,
            toFirestore: (FBPost post, _) => post.toFirestore());

    postRef.add(nuevoArticulo);
  }
}
