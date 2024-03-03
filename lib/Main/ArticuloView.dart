import 'package:flutter/material.dart';

class ArticuloView extends StatelessWidget {
  @override
  Widget build(BuildContext cotext) {
    return Scaffold(
      appBar: AppBar(title: Text("Artículo nº:"),),
        body: Column(
      children: [
        Text("RELLÉNAME"),
        Image.asset("resources/cambiame1.png",width: 30, height: 45),
        TextButton(onPressed: null, child: Text("Comprar"))
      ],
    ));
  }
}
