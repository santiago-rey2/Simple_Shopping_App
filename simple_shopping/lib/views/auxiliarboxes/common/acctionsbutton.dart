import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function()? function;
  final String label;
  final String? tag;
  final Color? background;
  final double? fontSize;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const ActionButton(
      {super.key,
      this.width,
      this.height,
      this.margin,
      this.function,
      required this.label,
      this.tag,
      this.background,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: FloatingActionButton.extended(
          onPressed:function,   
          label: Text(label,
              style: TextStyle(
                  fontSize: fontSize, fontWeight: FontWeight.w600, color: Colors.black)),
          backgroundColor: background,
          heroTag: tag),
    );
  }
}
