import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget {
  final String text;
  final int colorCode;
  final double fontSize;
  final int posicion;
  final Function(int indice) botonItemLista;
  final String rutaImagen;

  const PostCellView({
    super.key,
    required this.text,
    required this.colorCode,
    required this.fontSize,
    required this.posicion,
    required this.botonItemLista,
    required this.rutaImagen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          color: Colors.amber[colorCode],
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
              child:Image.asset(rutaImagen, width: 100, height: 100),),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(text, style: TextStyle(fontSize: fontSize))),
            ],
          ),
      ),
      onTap: () {
        botonItemLista(posicion);
      },
    );
    /*return Container(
        color: Colors.amber[colorCode],
        child: Row(
          children: [
            Image.asset("resources/cambiame1.png", width: 30, height: 45),
            Text(text, style: TextStyle(fontSize: fontSize)),
            TextButton(
                onPressed: null,
                child: Text("ver", style: TextStyle(fontSize: fontSize)))
          ],
        ));*/
  }
}
