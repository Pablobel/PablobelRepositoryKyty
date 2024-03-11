import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Custom/KTTextField.dart';

class RegisterView extends StatelessWidget {
  late BuildContext _context;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repitePasswordController = TextEditingController();
  SnackBar snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  void onClickCancelar() {
    Navigator.of(_context).pushNamed("/loginview");
  }

  void onClickAceptar() async {
    if (passwordController.text == repitePasswordController.text) {
      print('compruebo contraseñas');
      try {
        print('estoy en el try');
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,
        );

        Navigator.of(_context).pushNamed("/perfilview");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('Contraseña demasiado débil.');
        } else if (e.code == 'email-already-in-use') {
          print('Ya existe una cuenta con este email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(_context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    Column columna = Column(
      children: [
        Text("¡Regístrate y vuelve a tu infancia!", style: TextStyle(fontSize: 25)),
        KTTextField(tecController: userNameController, sHint: 'Usuario',rutaImagen: "resources/tienda.png"),
        KTTextField(
            tecController: passwordController,
            sHint: 'Contraseña',
            esContrasenia: true,rutaImagen: "resources/tienda.png"),
        KTTextField(
            tecController: repitePasswordController,
            sHint: 'Repetir contraseña',
            esContrasenia: true,rutaImagen: "resources/tienda.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onClickAceptar,
              child: Text("ACEPTAR"),
            ),
            TextButton(
              onPressed: onClickCancelar,
              child: Text("CANCELAR"),
            )
          ],
        )
      ],
    );
    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
    );
    Scaffold scaf = Scaffold(
      body: columna,
      appBar: appBar,
    );

    return scaf;
  }
}
