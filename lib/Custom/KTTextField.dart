import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row fila = Row(
      children: [
        Image.asset(
          "resources/cambiame1.png",
          width: 50,
          height: 50,
        ),
        Flexible(
            child: TextFormField(
                decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Contraseña',
        ))),
        Image.asset(
          "resources/cambiame1.png",
          width: 50,
          height: 50,
        ),
      ],
    );
    return fila;
  }
}
