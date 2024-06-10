import 'package:flutter/material.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';

class ArticuloView extends StatelessWidget {

  void onClickComprar(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DataHolder().selectedPost.nombre),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // Centra la columna horizontalmente
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(
              color: Colors.black26, width: 2),
        ),
                  child: Image.asset('resources/tienda.png',
                      width: 400, height: 400)),
              //Image.network(DataHolder().selectedPost.urlImagen, width: 100, height: 100),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 75, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black12, // Fondo blanco
                  borderRadius: BorderRadius.circular(5), // Bordes redondeados
                  border: Border.all(
                      color: Colors.black26, width: 1), // Borde negro
                ),
                child: Text(
                  DataHolder().selectedPost.descripcion,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black, // Color del texto
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white, // Fondo blanco para el precio
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      "Precio: " + DataHolder().selectedPost.precio.toString() + "€", // Reemplaza esto con el precio real
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Añade espacio entre el precio y el botón
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: TextButton(
                      onPressed: onClickComprar,
                      child: Text(
                        "COMPRAR",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
