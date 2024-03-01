import 'package:flutter/material.dart';
import 'package:kytypablo/Custom/PostCellView.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> post = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final List<double> fontSize = <double>[30, 15, 70];

  Widget? creadorDeItemLista(BuildContext context, int index) {
    return PostCellView(
        text: post[index],
        colorCode: colorCodes[index],
        fontSize: fontSize[index]);
  }

  Widget creadorDeSeparadorLista(BuildContext context,int index){
    return Column(
      children:[
        Divider(),
        //Imagen
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FRIKEANDO")),
      body: ListView.separated(
        padding: EdgeInsets.all(80),
        itemCount: post.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder:creadorDeSeparadorLista,
      ),
    );
  }
}
