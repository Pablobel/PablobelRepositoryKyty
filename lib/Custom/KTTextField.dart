import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget {
  String sHint;
  TextEditingController tecController;
  bool esContrasenia;
  double paddingH;
  double paddingV;

  KTTextField(
      {Key? key,
      this.sHint = "",
      required this.tecController,
      this.esContrasenia = false,
      this.paddingH=60,
      this.paddingV=16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: Row(
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
                        labelText: sHint))),
          ],
        ));
  }
}
