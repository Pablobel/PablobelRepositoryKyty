import 'package:flutter/material.dart';


class BottomMenu extends StatelessWidget {

  Function(int indice)? onBottonMenuPressed;

  BottomMenu({Key? key, required this.onBottonMenuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () => onBottonMenuPressed!(0),
          child: Icon(
            Icons.list,
            color: Colors.blue,
          )),
      TextButton(
          onPressed: () => onBottonMenuPressed!(1),
          child: Icon(
            Icons.grid_view,
            color: Colors.blue,
          )),
      TextButton(
          onPressed: () => onBottonMenuPressed!(2),
          child: Image.asset("resources/cambiame1.png", width: 30, height: 45))
    ]);
  }
}
