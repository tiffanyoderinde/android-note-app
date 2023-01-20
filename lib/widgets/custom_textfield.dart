import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.isObscure,
      this.showSufficIcon = false,
      this.controller,
      this.validator,
      this.onToggleVisibility});

  final String title;
  final bool? isObscure;
  final bool showSufficIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )),
        const SizedBox(height: 12),
        Container(
          height: 56,
          width: 327,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8FA), borderRadius: defaultBorderRadius),
          child: TextFormField(
            controller: controller,
            obscureText: isObscure ?? false,
            validator: validator,
            decoration: InputDecoration(
                fillColor: defaultGrey,
                focusColor: defaultGrey,
                focusedBorder: defaultBorder,
                enabledBorder: defaultBorder,
                border: defaultBorder,
                suffixIcon: showSufficIcon
                    ? GestureDetector(
                        onTap: onToggleVisibility,
                        child: Icon(
                          isObscure! ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF6E80B0),
                        ))
                    : null),
          ),
        )
      ],
    );
  }
}
