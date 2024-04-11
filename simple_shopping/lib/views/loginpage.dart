import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/screens/auxiliarboxes/Forms/formcontainer.dart';
import 'package:simple_shopping/screens/auxiliarboxes/Log/divisorlines.dart';
import 'package:simple_shopping/screens/auxiliarboxes/Log/loggoogl&facebook.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/acctionsbutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final presentationTextStyle = const TextStyle(
      fontSize: 48,
      color: AppColors.brandInitalTextColor,
      fontWeight: FontWeight.w600);
  final defaultContainerInputDecoration = BoxDecoration(
      color: AppColors.brandLightGreyColor,
      borderRadius: BorderRadius.circular(10));
  final activeContainerInputDecoration = BoxDecoration(
      color: AppColors.brandLightGreyColor,
      border: Border.all(color: AppColors.brandOnFocusLoginFormColor, width: 2),
      borderRadius: BorderRadius.circular(10));
  final defaultLabelStyle = const TextStyle(
      color: AppColors.brandLightTextColor, fontWeight: FontWeight.normal);
  final defaultBoxDecoration = BoxDecoration(
      color: AppColors.brandLightGreyColor,
      borderRadius: BorderRadius.circular(8));
  final defaultPaddingErrorFormText = const EdgeInsets.only(top: 1);
  final defaultDecorationButton = const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)));

  bool isChecked = false;

  @override
  void initState() {
    super.initState;
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandPrimaryColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          Container(
            margin: const EdgeInsetsDirectional.only(top: 120),
            child: Text(
              AppText.hello,
              style: presentationTextStyle,
            ),
          ),
          Form(
              key: _loginKey,
              child: Column(
                children: [
                  //Box de texto para introducir el usuario
                  FormsContainer(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.only(left: 18),
                    label: AppText.username,
                    placeHolder: AppText.usernameexample,
                    validator: (value) {
                      debugPrint(value);
                      if (value == '') {
                        return AppErrorText.nocorrectemail;
                      }
                      return null;
                    },
                  ),
                  //Input Box de texto para introducir la contraseña del usuario
                  const FormsContainer(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 18),
                    label: AppText.password,
                    placeHolder: AppText.password,
                  ),
                ],
              )),
          //Fila con checkbox y recuperar contraseña
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    const Text(AppText.remenberPsw),
                  ],
                ),
                const Text(
                  AppText.recoveryPsw,
                  style: TextStyle(
                      color: AppColors.brandLightTextColor, fontSize: 12),
                )
              ],
            ),
          ),
          //Boton de acceso al log
          ActionButton(
            width: 344,
            height: 50,
            label: AppText.login,
            margin: const EdgeInsets.only(top: 66),
            background: AppColors.brandLoginButtonColor,
            labelStyle: const TextStyle(fontSize: 20) ,
            shape: defaultDecorationButton,
            function: () {
                if (_loginKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.home);
                }
              },
          ),
          //Barra de división con 
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const DivisorLines(middletext: AppText.logInWith),
          ),
          //Login con facebook y google
          LogInWith(
            margin: const EdgeInsets.only(top: 20),
          ),
          //Texto de acceso a registrarse
          Container(
            margin: const EdgeInsets.only(top: 130, left: 65),
            child: Row(
              children: [
                const Text(AppText.notAreAMember),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signin);
                  },
                  child: const Text(
                    AppText.registerNow,
                    style:
                        TextStyle(color: AppColors.brandOnFocusLoginFormColor),
                  ),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
