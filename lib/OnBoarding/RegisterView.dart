import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  late BuildContext _context;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repitePasswordController = TextEditingController();

  void onClickCancelar() {
    Navigator.of(_context).pushNamed("/loginview");
  }

  void onClickAceptar() async{

  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    Column columna = Column(
      children: [
        Text("Kyty Register", style: TextStyle(fontSize: 25)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          child: TextField(
            controller:userNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Usuario',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Contraseña',
            ),
            obscureText: true,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          child: TextFormField(
            controller: repitePasswordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Repetir Contraseña',
            ),
            obscureText: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
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
