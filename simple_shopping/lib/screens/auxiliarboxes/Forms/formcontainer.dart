import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/colors.dart';

class FormsContainer extends StatefulWidget {
  final String? placeHolder;
  final String? label;
  final EdgeInsets? margin;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;

  const FormsContainer(
      {super.key, this.label, this.placeHolder, this.margin, this.padding,this.validator});

  @override
  State<FormsContainer> createState() => _FormsContainerState();
}

class _FormsContainerState extends State<FormsContainer> {
  late BoxDecoration containerDecoration;

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
    containerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: widget.padding,
      margin: widget.margin,
      decoration: containerDecoration,
      child: TextFormField(
        onTap: () {
          setState(() {
            containerDecoration = activeContainerInputDecoration;
          });
        },
        onTapOutside: (event) {
          setState(() {
            containerDecoration = defaultContainerInputDecoration;
            FocusScope.of(context).unfocus();
          });
        },
        validator: widget.validator,
        decoration: InputDecoration(
            border: defaultInputBorder,
            contentPadding: defaultPaddingErrorFormText,
            hintText: widget.placeHolder,
            labelText: widget.label,
            labelStyle: defaultLabelStyle),
      ),
    );
  }
}
