import 'package:flutter/material.dart';

List<int> numeros = List.generate(30, (index) => index +1);

class Desplegable extends StatefulWidget {
  const Desplegable({super.key});

  @override
  State<Desplegable> createState() => _DesplegableState();
}

class _DesplegableState extends State<Desplegable> {
  int dropmenuvalue = numeros.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        value: dropmenuvalue,
        borderRadius: BorderRadius.circular(8),
        isExpanded: true,
        underline: Container(height: 0),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        onChanged: (int? value) {
          setState(() {
            dropmenuvalue = value!;
          });
        },
        items: numeros.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('Cantidad : $value'),
          );
        }).toList());
  }
}
