import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget {
  final String text;
  final int colorCode;
  final double fontSize;
  final double height;

  const PostGridCellView(
      {super.key,
      required this.text,
      required this.colorCode,
      required this.fontSize,
      required this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FractionallySizedBox(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.2,
                  image: NetworkImage(
                      "resources/cambiame2.png"),
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
    );
  }
}
