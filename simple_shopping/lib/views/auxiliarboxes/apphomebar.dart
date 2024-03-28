import 'package:flutter/material.dart';

class AppHomeBar extends StatelessWidget{
  const AppHomeBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Shopping_App',style: TextStyle(color: Colors.black),),
        IconButton(onPressed : (){  }, icon:const Icon(Icons.shopping_cart))
      ],
    );
  }

}
  