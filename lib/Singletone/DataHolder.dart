import '../FirestoreObjects/FBPost.dart';

class DataHolder {
  static final DataHolder _dataHolder = new DataHolder._internal();

  String nombre = "Título DataHolder";
  late FBPost selectedPost;

  DataHolder._internal() {}

  factory DataHolder() {
    return _dataHolder;
  }
}
