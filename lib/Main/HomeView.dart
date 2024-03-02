import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/Custom/PostCellView.dart';
import '../FirestoreObjects/FBPost.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FBPost> articulos = [];


  @override
  void initState() {
    super.initState();
    descargarPost();
  }

  void descargarPost() async{
    CollectionReference<FBPost> ref =
    db.collection("Articulos").withConverter(
      fromFirestore: FBPost.fromFirestore,
      toFirestore: (FBPost articulo, _) => articulo.toFirestore(),
    );
    QuerySnapshot<FBPost> querySnapshot = await ref.get();
    for(int i = 0;i<querySnapshot.docs.length;i++){
      setState(() {
        articulos.add(querySnapshot.docs[i].data());
      });

    }

  }


  Widget? creadorDeItemLista(BuildContext context, int index) {
    return PostCellView(
        text: articulos[index].nombre,
        colorCode: 0,
        fontSize: 20);
  }

  Widget creadorDeSeparadorLista(BuildContext context,int index){
    return Column(
      children:[
        Divider(),
        //Imagen
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FRIKEANDO")),
      body: ListView.separated(
        padding: EdgeInsets.all(80),
        itemCount: articulos.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder:creadorDeSeparadorLista,
      ),
    );
  }
}
