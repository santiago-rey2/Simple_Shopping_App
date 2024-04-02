import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';

class AppHomeBar extends StatelessWidget implements PreferredSizeWidget {
  final String actualroute;
  final Widget? leading;
  const AppHomeBar({super.key, required this.actualroute,this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: _AppHomeBarWidget(
        actualroute: actualroute,
      ),
      backgroundColor: AppColors.brandPrimaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHomeBarWidget extends StatelessWidget {
  final String actualroute;
  const _AppHomeBarWidget({required this.actualroute});

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
              if (AppRoutes.cartview != actualroute) {
                Navigator.pushNamed(context, AppRoutes.cartview);
              }
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}
