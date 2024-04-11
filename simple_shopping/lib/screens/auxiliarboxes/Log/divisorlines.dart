import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/colors.dart';

class DivisorLines extends StatelessWidget {
  final String middletext;
  const DivisorLines({super.key, required this.middletext});

  final defaultLineDecoration =
      const BoxDecoration(color: AppColors.brandDivisorLineColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 120,
          height: 1,
          decoration: defaultLineDecoration,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            middletext,
            style:const TextStyle(color: Colors.black),
          ),
        ),
        Container(
          width: 120,
          height: 1,
          decoration: defaultLineDecoration,
        )
      ],
    );
  }
}
