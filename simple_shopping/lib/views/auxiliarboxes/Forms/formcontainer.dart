import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';

class FormsContainer extends StatefulWidget {
  const FormsContainer({super.key});

  @override
  State<FormsContainer> createState() => _FormsContainerState();
}

class _FormsContainerState extends State<FormsContainer> {

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
  final defaultPaddingErrorFormText = const EdgeInsets.only(top: 1);
  final defaultLabelStyle = const TextStyle(
      color: AppColors.brandLightTextColor, fontWeight: FontWeight.normal);
  

@override
  void initState() {
    super.initState;
    userContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.only(left: 18),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: userContainerDecoration,
      child: TextFormField(
        onTap: () {
          setState(() {
            userContainerDecoration = activeContainerInputDecoration;
          });
        },
        onTapOutside: (event) {
          setState(() {
            userContainerDecoration = defaultContainerInputDecoration;
            FocusScope.of(context).unfocus();
          });
        },
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
            border: defaultInputBorder,
            contentPadding: defaultPaddingErrorFormText,
            hintText: AppText.usernameexample,
            labelText: AppText.username,
            labelStyle: defaultLabelStyle),
      ),
    );
  }
}
