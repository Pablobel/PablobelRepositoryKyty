import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget {
  final String text;
  final int colorCode;
  final double fontSize;
  final double height;
  final int posicion;
  final Function(int indice) botonItemMatriz;

  const PostGridCellView(
      {super.key,
      required this.text,
      required this.colorCode,
      required this.fontSize,
      required this.height,
      required this.posicion,
      required this.botonItemMatriz});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: FractionallySizedBox(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.2,
                    image: NetworkImage("resources/cambiame1.png"),
                    fit: BoxFit.cover)),
            color: Colors.amber[colorCode],
            child: Column(
              children: [
                Image.asset("resources/cambiame2.png", width: 70, height: 70),
                Text(text, style: TextStyle(fontSize: fontSize)),
                TextButton(
                    onPressed: null,
                    child: Text("+", style: TextStyle(fontSize: fontSize)))
              ],
            )),
      ),
      onTap: () {
        botonItemMatriz(posicion);
      },
    );
  }
}
