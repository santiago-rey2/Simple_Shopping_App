import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function()? function;
  final String label;
  final String? tag;
  final Color? background;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final ShapeBorder? shape;
  final TextStyle? labelStyle;

  const ActionButton(
      {super.key,
      this.width,
      this.height,
      this.margin,
      this.function,
      required this.label,
      this.tag,
      this.background,
      this.shape,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    if (labelStyle == null) {
      
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: FloatingActionButton.extended(
          onPressed: function,
          label: Text(label, style: labelStyle),
          backgroundColor: background,
          shape: shape,
          heroTag: tag),
    );
  }
}
