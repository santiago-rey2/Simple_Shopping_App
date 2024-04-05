import "package:flutter/material.dart";
import "package:simple_shopping/settings/app_text.dart";
import "package:simple_shopping/settings/colors.dart";

class PanelLateral extends StatelessWidget {
  const PanelLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.brandSecondaryColor,
      child: Column(children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.brandPrimaryColor,
          title: const Text('Opciones'),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
        ),
        const _Tiles(name: AppText.orders),
        const _Tiles(name: AppText.profile),
        const _Tiles(name: AppText.categories),
      ]),
    );
  }
}

class _Tiles extends StatelessWidget {
  final String name;

  const _Tiles({required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(color: AppColors.brandLightGreyColor),
          margin: const EdgeInsets.only(top: 4),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          )),
      onTap: () {
        debugPrint('Pulsado $name');
      },
    );
  }
}
