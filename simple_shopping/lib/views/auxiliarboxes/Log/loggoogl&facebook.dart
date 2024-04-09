import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';

class LogInWith extends StatelessWidget {

  final double topmargin;


  LogInWith({super.key,required this.topmargin});

  final defaultBoxDecoration = BoxDecoration(
      color: AppColors.brandLightGreyColor,
      borderRadius: BorderRadius.circular(8));

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(top: topmargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: defaultBoxDecoration,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/LogoGoogleTransparente.png',
                        width: 24,
                        height: 24,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          AppText.loginwithgoogle,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: defaultBoxDecoration,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/facebook-logo-2019.png',
                        width: 24,
                        height: 24,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          AppText.loginwithfacebook,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}