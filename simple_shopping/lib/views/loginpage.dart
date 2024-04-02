import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsetsDirectional.only(top: 100),
            child: const Text(
              AppText.hello,
              style: TextStyle(
                  fontSize: 48, color: Color.fromRGBO(0, 87, 255, 1)),
            ),
          ),
          Form(
              key: _loginKey,
              child: Column(
                children: [
                  //Box de texto para introducir el usuario
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.brandLightColor,
                        borderRadius: BorderRadius.circular(10)),
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin:
                        const EdgeInsets.only(top: 128, left: 30, right: 30),
                    child: TextFormField(
                      validator: (value) {
                        return (value != null && !value.contains('@'))
                            ? AppText.nocorrectemail
                            : null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppText.usernameexample,
                          labelText: AppText.username),
                    ),
                  ),
                  //Input Box de texto para introducir la contraseña del usuario
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.brandLightColor,
                        borderRadius: BorderRadius.circular(10)),
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(top: 4, left: 30, right: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return AppText.nopassworderror;
                        }
                        if (value.length < 8) {
                          return AppText.nolongerpassword;
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppText.password,
                          labelText: AppText.password),
                    ),
                  ),
                ],
              )),
          //Boton de acceso al log
          Container(
            width: 344,
            height: 50,
            margin: const EdgeInsets.only(top: 60),
            child: FloatingActionButton.extended(
              backgroundColor: AppColors.brandLoginButtonColor,
              onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, AppRoutes.productlist);
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
            margin: const EdgeInsets.only(top: 84, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 146,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.brandLightColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const SizedBox(width: 8,),
                      Image.asset('assets/LogoGoogleTransparente.png',width: 24,height: 24,),
                      const SizedBox(width: 30,),
                      const Center(
                        child: Text(
                          AppText.loginwithgoogle,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.brandLightColor,
                      borderRadius: BorderRadius.circular(8)),
                  child:  Row(
                    children: [
                      const SizedBox(width: 8,),
                      Image.asset('assets/facebook-logo-2019.png',width: 24,height: 24,),
                      const SizedBox(width: 20,),
                      const Center(
                        child: Text(
                          AppText.loginwithfacebook,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
