import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/colors.dart';

class SigInPage extends StatefulWidget {
  const SigInPage({super.key});

  @override
  State<SigInPage> createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.brandPrimaryColor,
      floatingActionButton: FloatingActionButton(onPressed: (){},child :const Icon(Icons.arrow_left_rounded) ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
    );
  }
}