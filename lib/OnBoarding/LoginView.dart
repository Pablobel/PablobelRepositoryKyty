import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Column columna = Column(children: [
      Text("Kyty Login",style: TextStyle(fontSize: 25)),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Usuario',
          ),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Contraseña',
          ),
          obscureText: true,
        ),
      ),
    ],);
    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.black,
      backgroundColor: Colors.blue,
    );
    Scaffold scaf=Scaffold(body: columna,
      appBar: appBar,);

    return scaf;

  }

}