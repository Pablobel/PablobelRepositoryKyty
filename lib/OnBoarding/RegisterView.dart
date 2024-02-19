import 'package:flutter/material.dart';

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
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,);

        Navigator.of(_context).pushNamed("/loginview");

      }on FirebaseAuthException cath (e){
        if(e.code=='weak-password'){
          print('Contraseña demasiado débil.');
        }else if (e.code == 'email-already-in-use'){
          print('Ya existe una cuenta con este email.');
        }
      }catch(e){
        print(e);
    }
    }else{
      ScaffoldMessenger.of(_context).showSnackBar(snackBar);
    }
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
            controller: userNameController,
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
