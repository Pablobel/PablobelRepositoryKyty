import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/Custom/PostCellView.dart';
import '../Custom/BottomMenu.dart';
import '../Custom/DrawerClass.dart';
import '../Custom/PostGridCellView.dart';
import '../FirestoreObjects/FBPost.dart';
import '../OnBoarding/LoginView.dart';
import '../Singletone/DataHolder.dart';

class MasterHomeView extends StatefulWidget {
  @override
  State<MasterHomeView> createState() => _MasterHomeViewState();
}

class _MasterHomeViewState extends State<MasterHomeView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FBPost> articulos = [];
  bool isList = false;
  late String categoria;

  void onBottonMenuPressed(int indice) {
    if (indice == 0) {
      setState(() {
        isList = true;
      });
    } else if (indice == 1) {
      setState(() {
        isList = false;
      });
    }
  }

  void homeViewDrawerOnTap(int indice) {
    if (indice == 0) {
      FirebaseAuth.instance.signOut();
      //Navigator.of(context).pop();
      //Navigator.of(context).popAndPushNamed("/loginview");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginView()),
        ModalRoute.withName('/loginview'),
      );
    } else if (indice == 1) {}
  }

  @override
  void initState() {
    super.initState();
    compruebaCategoria();
    descargarPost();
  }

  void compruebaCategoria() {
    if (DataHolder().categoria == 0) {
      categoria = "Comics";
    } else if (DataHolder().categoria == 1) {
      categoria = "Tomos";
    } else if (DataHolder().categoria == 2) {
      categoria = "Magic";
    } else if (DataHolder().categoria == 3) {
      categoria = "Yu-Gi-Oh";
    } else if (DataHolder().categoria == 4) {
      categoria = "Juegos Retro";
    }
  }

  void descargarPost() async {
    CollectionReference<FBPost> ref = db.collection(categoria).withConverter(
          fromFirestore: FBPost.fromFirestore,
          toFirestore: (FBPost articulo, _) => articulo.toFirestore(),
        );
    QuerySnapshot<FBPost> querySnapshot = await ref.get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      setState(() {
        articulos.add(querySnapshot.docs[i].data());
      });
    }
  }

  void botonItemLista(int indice) {
    DataHolder().selectedPost = articulos[indice];
    Navigator.of(context).pushNamed("/articuloview");
  }

  Widget? creadorDeItemLista(BuildContext context, int index) {
    return PostCellView(
      text: articulos[index].nombre,
      colorCode: 0,
      fontSize: 20,
      posicion: index,
      botonItemLista: botonItemLista,
    );
  }

  Widget creadorDeSeparadorLista(BuildContext context, int index) {
    return Column(
      children: [
        Divider(),
        //Imagen
      ],
    );
  }

  Widget? creadorDeItemMatriz(BuildContext context, int index) {
    return PostGridCellView(
      text: articulos[index].nombre,
      fontSize: 60,
      colorCode: 0,
      height: 200,
      posicion: index,
      botonItemMatriz: botonItemLista,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FRIKEANDO")),
      body: Center(
        child: celdasOLista(isList),
      ),
      bottomNavigationBar:
          BottomMenu(onBottonMenuPressed: this.onBottonMenuPressed),
      drawer: DrawerClass(onItemTap: homeViewDrawerOnTap),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/creacionarticuloview');
          },
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      /*ListView.separated(
        padding: EdgeInsets.all(80),
        itemCount: articulos.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      ),*/
    );
  }

  Widget celdasOLista(bool isList) {
    if (isList) {
      return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: articulos.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      );
    } else {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
          itemCount: articulos.length,
          itemBuilder: creadorDeItemMatriz);
    }
  }
}
