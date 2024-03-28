import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';

class AppHomeBar extends StatelessWidget {
  const AppHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Shopping_App',
          style: TextStyle(color: Colors.black),
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cartview);
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}
