import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/views/auxiliarboxes/Forms/formcontainer.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/divisorlines.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/loggoogl&facebook.dart';

class SignInPage extends StatefulWidget {
   const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final sigInTextStyle = const TextStyle(
      fontSize: 32,
      color: AppColors.brandInitalTextColor,
      fontWeight: FontWeight.w600);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandPrimaryColor,
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 120,
                ),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppText.sigIn,
                  style: sigInTextStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const DivisorLines(middletext: AppText.sigInWith)
              ),
              LogInWith(topmargin: 20,),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const DivisorLines(middletext: AppText.or)),
              const Form(child: Column(
                children: [
                  FormsContainer()
                ],
              ))
              
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: FloatingActionButton(
          backgroundColor: AppColors.brandLightGreyColor,
          onPressed: () {
            return print('pulsamos el boton');
          },
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                  width: 2, color: AppColors.brandOnFocusLoginFormColor),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          )),
    );
  }
}
