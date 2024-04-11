import 'package:flutter/material.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/settings/app_text.dart';

class Miscelaneous extends StatefulWidget {
  const Miscelaneous({super.key});

  @override
  State<Miscelaneous> createState() => _MiscelaneousState();
}

class _MiscelaneousState extends State<Miscelaneous> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: AppHomeBar(),body: Center(child: Text(AppText.miscelaneous)));
  }
}