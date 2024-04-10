import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_images.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/views/auxiliarboxes/home/search_container.dart';

class AppHomeBar extends StatelessWidget implements PreferredSizeWidget {
  final String actualroute;
  const AppHomeBar({super.key, required this.actualroute});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Image.asset(AppImages.logoGoogle)),
        const SearchBox(width: 280,),
      ],
    );
  }
}
