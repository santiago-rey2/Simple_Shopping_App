import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/views/auxiliarboxes/Forms/formcontainer.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/divisorlines.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/loggoogl&facebook.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/acctionsbutton.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInKey = GlobalKey<FormState>();
  final sigInTextStyle = const TextStyle(
      fontSize: 32,
      color: AppColors.brandInitalTextColor,
      fontWeight: FontWeight.w600);
  final registerButtonDecoration = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)));

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
                  child: const DivisorLines(middletext: AppText.sigInWith)),
              LogInWith(
                margin: const EdgeInsets.only(top: 20),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const DivisorLines(middletext: AppText.or)),
              Form(
                  key: _signInKey,
                  child: const Column(
                    children: [
                      FormsContainer(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 18),
                        label: AppText.username,
                      ),
                      FormsContainer(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 18),
                        label: AppText.email,
                      ),
                      FormsContainer(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 18),
                        label: AppText.password,
                      ),
                      FormsContainer(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 18),
                        label: AppText.repeatPsw,
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 45),
                width: 344,
                height: 50,
                child: ActionButton(
                  function: () {
                    Navigator.pop(context);
                  },
                  label: AppText.getStarted,
                  shape: registerButtonDecoration,
                  labelStyle: const TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
              Container(
                height: 1,
                width: 344,
                margin: const EdgeInsets.only(top: 20),
                decoration:
                    const BoxDecoration(color: AppColors.brandDivisorLineColor),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 65),
                child: Row(
                  children: [
                    const Text(AppText.areAMember),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        AppText.login,
                        style: TextStyle(
                            color: AppColors.brandOnFocusLoginFormColor),
                      ),
                    )
                  ],
                ),
              )
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
            Navigator.pop(context);
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
