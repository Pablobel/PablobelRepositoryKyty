import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget {
  final String text;
  final int colorCode;
  final double fontSize;
  final double height;
  final int posicion;
  final Function(int indice) botonItemMatriz;
  final String urlImagen;

  const PostGridCellView(
      {super.key,
      required this.text,
      required this.colorCode,
      required this.fontSize,
      required this.height,
      required this.posicion,
      required this.botonItemMatriz,
      required this.urlImagen});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: FractionallySizedBox(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    image: NetworkImage("resources/tienda.png"),
                    fit: BoxFit.cover)),
            color: Colors.amber[colorCode],
            child: Column(
              children: [
                Image.network("https://firebasestorage.googleapis.com/v0/b/kytypablo-7bcf6.appspot.com/o/Comics%2F1710143996604.jpg?alt=media&token=c085c065-0c19-4c63-a925-751882909d42", width: 70, height: 70),
                Text(text, style: TextStyle(fontSize: fontSize)),

              ],
            )),
      ),
      onTap: () {
        botonItemMatriz(posicion);
      },
    );
  }
}
