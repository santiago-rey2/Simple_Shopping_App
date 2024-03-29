import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';

class AppHomeBar extends StatelessWidget {
  final String actualroute;
  const AppHomeBar({super.key,required this.actualroute});

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          AppText.apptitle,
          style: TextStyle(color: Colors.black),
        ),
        IconButton(
            onPressed: () {
              if(AppRoutes.cartview != actualroute){
                Navigator.pushNamed(context, AppRoutes.cartview);
              }
                
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}
