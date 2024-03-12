import 'package:flutter/material.dart';

class DrawerClass extends StatelessWidget {
  Function(int indice)? onItemTap;

  DrawerClass({Key? key, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(style: TextStyle(color: Colors.white), 'Header'),
          ),
          ListTile(
            leading: Image.asset('resources/tienda.png'),
            selectedColor: Colors.blue,
            selected: true,
            title: const Text('Salir'),
            onTap: () {
              onItemTap!(0);
            },
          ),
          ListTile(
            leading: Image.asset('resources/temperaturas.png'),
            title: const Text('Temperaturas del mundo'),
            onTap: () {
              onItemTap!(1);
            },
          ),
        ],
      ),
    );
  }
}
