import 'package:flutter/material.dart';

import '../Interfaces/BottomMenuEvents.dart';

class BottomMenu extends StatelessWidget {
  BottomMenuEvents events;

  BottomMenu({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () => events.onBottonMenuPressed(0),
          child: Icon(
            Icons.list,
            color: Colors.blue,
          )),
      TextButton(
          onPressed: () => events.onBottonMenuPressed(1),
          child: Icon(
            Icons.grid_view,
            color: Colors.blue,
          )),
      TextButton(
          onPressed: () => events.onBottonMenuPressed(2),
          child: Image.asset("resources/cambiame1.png", width: 30, height: 45))
    ]);
  }
}
