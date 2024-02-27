import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget {
  String sHint;
  TextEditingController tecController;
  bool esContrasenia;

  KTTextField(
      {Key? key,
      this.sHint = "",
      required this.tecController,
      this.esContrasenia = false})
      : super(key: key);

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
              controller: tecController,
                obscureText: esContrasenia,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.lightBlueAccent,
                  filled: true,
                  labelText: sHint
                ))),
      ],
    );
    return fila;
  }
}
