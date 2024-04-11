import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_images.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/screens/auxiliarboxes/home/search_container.dart';

class AppHomeBar extends StatelessWidget implements PreferredSizeWidget {
  final double? searchWidth;

  const AppHomeBar({super.key,this.searchWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _AppHomeBarWidget(
        width: searchWidth ?? 290,
      ),
      centerTitle: true,
      backgroundColor: AppColors.brandPrimaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHomeBarWidget extends StatelessWidget {
  final double width;
  const _AppHomeBarWidget({required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Image.asset(AppImages.logoGoogle)),
         SearchBox(
          width: width,
        ),
      ],
    );
  }
}
