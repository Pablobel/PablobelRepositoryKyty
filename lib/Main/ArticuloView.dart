import 'package:flutter/material.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';

class ArticuloView extends StatelessWidget {
  @override
  Widget build(BuildContext cotext) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DataHolder().nombre),
        ),
        body: Column(
          children: [
            Text(DataHolder().selectedPost.descripcion),
            Image.network(DataHolder().selectedPost.urlImagen, width: 30, height: 45),
            TextButton(onPressed: null, child: Text("Comprar"))
          ],
        ));
  }
}
