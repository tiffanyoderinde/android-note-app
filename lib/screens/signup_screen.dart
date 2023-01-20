// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/default_blue_button.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create a new account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6E80B0)),
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    title: 'Your Full Name',
                    controller: fullNameController,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    title: 'Your Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    title: 'Your Phone Number',
                    controller: phoneController,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    title: 'Password',
                    controller: passwordController,
                    isObscure: isObscure,
                    showSufficIcon: true,
                    onToggleVisibility: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  const SizedBox(height: 64),
                  DefaultBlueButton(
                    text: 'Sign Up',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        AuthService().signUp(
                            emailController.text,
                            passwordController.text,
                            fullNameController.text,
                            phoneController.text,
                            context);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: mediumTextStyle(FontWeight.w400),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Log in',
                          style: mediumTextStyle(FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
