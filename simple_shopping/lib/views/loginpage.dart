import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/divisorlines.dart';
import 'package:simple_shopping/views/auxiliarboxes/Log/loggoogl&facebook.dart';

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
                  Container(
                    height: 64,
                    padding: const EdgeInsets.only(left: 18),
                    margin: const EdgeInsets.only(top: 50),
                    decoration: userContainerDecoration,
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          userContainerDecoration =
                              activeContainerInputDecoration;
                          pswContainerDecoration =
                              defaultContainerInputDecoration;
                        });
                      },
                      onTapOutside: (event) {
                        setState(() {
                          userContainerDecoration =
                              defaultContainerInputDecoration;
                          FocusScope.of(context).unfocus();
                        });
                      },
                      validator: (value) {
                        debugPrint(value);
                        if (value == '') {
                          return AppErrorText.nocorrectemail;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: defaultInputBorder,
                          contentPadding: defaultPaddingErrorFormText,
                          hintText: AppText.usernameexample,
                          labelText: AppText.username,
                          labelStyle: defaultLabelStyle),
                    ),
                  ),
                  //Input Box de texto para introducir la contraseña del usuario
                  Container(
                    height: 64,
                    decoration: pswContainerDecoration,
                    padding: const EdgeInsets.only(left: 18),
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          userContainerDecoration =
                              defaultContainerInputDecoration;
                          pswContainerDecoration =
                              activeContainerInputDecoration;
                        });
                      },
                      onTapOutside: (event) {
                        setState(() {
                          pswContainerDecoration =
                              defaultContainerInputDecoration;
                          FocusScope.of(context).unfocus();
                        });
                      },
                      validator: (value) {
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: defaultInputBorder,
                          contentPadding: defaultPaddingErrorFormText,
                          hintText: AppText.password,
                          label: const Text(AppText.password),
                          labelStyle: defaultLabelStyle),
                    ),
                  ),
                ],
              )),
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
          Container(
            width: 344,
            height: 50,
            margin: const EdgeInsets.only(top: 66),
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.brandLoginButtonColor,
              onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.productlist);
                }
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              label: const Text(
                AppText.login,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 34),
            child: const DivisorLines(middletext: AppText.logInWith),
          ),
          LogInWith(topmargin: 60,),
          Container(
            margin: const EdgeInsets.only(top: 70, left: 65),
            child: Row(
              children: [
                const Text(AppText.notAreAMember),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.signin);
                  },
                  child: const Text(
                    AppText.registerNow,
                    style: TextStyle(color: AppColors.brandOnFocusLoginFormColor),
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
