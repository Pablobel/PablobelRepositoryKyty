import 'package:flutter/material.dart';

class LoginViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Móvil'),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Próximamente también en tu móvil",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
