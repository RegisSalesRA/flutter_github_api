import 'package:flutter/material.dart';

import '../services/apiStarred.dart';

class Starred extends StatefulWidget {
  Starred({Key? key}) : super(key: key);
  bool confere = false;
  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  List<String> foods = ["Abacaxi", "Laranja", "Limao"];
  List<String> foodsFilter = [];

  void modificarStado() {
    setState(() {
      widget.confere = !widget.confere;
    });
  }

  void filtrarItens() {
    setState(() {
      foodsFilter = [];
    });
    var foodList = foods.where((element) => element.contains("L")).toList();
    for (String food in foodList) {
      foodsFilter.add(food);
      print(food);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            filtrarItens();
            print(foodsFilter);
          }),
      appBar: AppBar(title: Text("Titulo")),
      body: widget.confere ? Text("Verdadeiro") : Text("Falso"),
    );
  }
}
