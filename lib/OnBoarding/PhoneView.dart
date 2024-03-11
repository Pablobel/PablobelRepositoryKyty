import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kytypablo/Custom/KTTextField.dart';

class PhoneView extends StatefulWidget {
  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController verifyController = TextEditingController();
  String code = "";
  bool mostrarVerificacion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        KTTextField(
            tecController: phoneController, rutaImagen: "resources/tienda.png"),
        TextButton(onPressed: enviarNumTelefono, child: Text("Recibir SMS")),
        if (mostrarVerificacion)
          KTTextField(
              tecController: verifyController,
              rutaImagen: "resources/tienda.png"),
        if (mostrarVerificacion)
          TextButton(onPressed: enviarVerify, child: Text("Verificar")),
      ],
    ));
  }

  void enviarVerify() async {
    String sms = verifyController.text;
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: code, smsCode: sms);

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.of(context).popAndPushNamed("homeview");
  }

  void enviarNumTelefono() async {
    String telefono = phoneController.text;

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: telefono,
        verificationCompleted: verificacionCompletada,
        verificationFailed: verificacionFallida,
        codeSent: codigoEnviado,
        codeAutoRetrievalTimeout: tiempoDeEsperaAgotado);
  }

  void verificacionCompletada(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).popAndPushNamed("homeview");
  }

  void verificacionFallida(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void codigoEnviado(String codigo, int? resendToken) async {
    code = codigo;
    setState(() {
      mostrarVerificacion = true;
    });
  }

  void tiempoDeEsperaAgotado(String ID) {}
}
