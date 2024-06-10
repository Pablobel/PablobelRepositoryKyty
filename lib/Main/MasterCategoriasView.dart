import 'dart:js';
import 'package:flutter/material.dart';
import 'package:kytypablo/Singletone/DataHolder.dart';
import '../Custom/PostCellView.dart';

class MasterCategoriasView extends StatelessWidget {
  final List<String> categorias = [
    "Comics",
    "Tomos",
    "Magic",
    "Yu-Gi-Oh",
    "Juegos Retro"
  ];
  final List<String> imagenCategorias = [
    "comics",
    "tomos",
    "magic",
    "yugioh",
    "juegosretro"
  ];
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('!FRIKEANDO¡ ¡Tu tienda de confianza!'),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: cargarCategorias(),
      ),
    );
  }

  Widget? cargarCategorias() {
    return ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: categorias.length,
      itemBuilder: creadorDeItemLista,
      separatorBuilder: creadorDeSeparadorLista,
    );
  }

  Widget? creadorDeItemLista(BuildContext context, int index) {
    return PostCellView(
      text: categorias[index],
      colorCode: 0,
      fontSize: 40,
      posicion: index,
      botonItemLista: botonItemLista,
      rutaImagen: "resources/" + imagenCategorias[index] + ".png",
    );
  }

  Widget creadorDeSeparadorLista(BuildContext context, int index) {
    return Column(
      children: [
        Divider(),
        //Imagen
      ],
    );
  }

  void botonItemLista(int indice) {
    DataHolder().categoria = indice;
    print(indice);
    Navigator.of(_context).pushNamed("/masterhomeview");
    print("soy master");
  }
}
