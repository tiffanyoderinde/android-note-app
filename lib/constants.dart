import 'package:flutter/material.dart';

const defaultGrey = Color(0xFFF8F8FA);

const defaultBlue = Color(0xFF1F1970);

final defaultBorderRadius = BorderRadius.circular(18);

final defaultBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, width: 0),
    borderRadius: defaultBorderRadius);

Widget centeredText(String text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
    ),
  );
}

TextStyle mediumTextStyle(FontWeight fontWeight) {
  return TextStyle(
      color: const Color.fromRGBO(110, 128, 176, 1),
      fontSize: 14,
      fontWeight: fontWeight);
}
