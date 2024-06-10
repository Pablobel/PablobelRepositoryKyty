import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget {
  String sHint;
  TextEditingController tecController;
  bool esContrasenia;
  double paddingH;
  double paddingV;
  String rutaImagen;

  KTTextField(
      {Key? key,
      this.sHint = "",
      required this.tecController,
      required this.rutaImagen,
      this.esContrasenia = false,
      this.paddingH = 60,
      this.paddingV = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // Ajusta el radio de los bordes redondeados según tus necesidades
                border: Border.all(
                  color: Colors.black, // Color del borde
                  width: 2, // Ancho del borde
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Asegúrate de que el borde redondeado también se aplica a la imagen
                child: Image.asset(
                  rutaImagen,
                  width: 50,
                  height: 50,
                ),
              ),
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
