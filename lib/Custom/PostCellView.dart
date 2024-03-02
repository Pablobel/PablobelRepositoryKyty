import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget {
  final String text;
  final int colorCode;
  final double fontSize;

  const PostCellView(
      {super.key,
      required this.text,
      required this.colorCode,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[colorCode],
        child: Row(
          children: [
            Image.asset("resources/cambiame1.png", width: 30, height: 45),
            Text(text, style: TextStyle(fontSize: fontSize)),
            TextButton(
                onPressed: null,
                child: Text("ver", style: TextStyle(fontSize: fontSize)))
          ],
        ));
  }
}
