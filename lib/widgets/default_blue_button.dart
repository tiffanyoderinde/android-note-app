import 'package:tiffany/constants.dart';
import 'package:flutter/material.dart';

class DefaultBlueButton extends StatelessWidget {
  const DefaultBlueButton(
      {super.key, required this.text, this.onTap, this.height, this.width});

  final String text;
  final double? height;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 64,
        width: width ?? 327,
        decoration: BoxDecoration(
            color: defaultBlue, borderRadius: defaultBorderRadius),
        child: centeredText(text),
      ),
    );
  }
}
