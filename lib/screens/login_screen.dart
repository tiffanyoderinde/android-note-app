import 'package:flutter/material.dart';
import 'package:tiffany/screens/signup_screen.dart';
import '../constants.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/default_blue_button.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  final authService = AuthService();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 38),
                  const Text(
                    'or Login with Email',
                    style: TextStyle(
                        color: Color(0xFF6E80B0), fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    title: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value!.length < 2) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    title: 'Password',
                    controller: passwordController,
                    isObscure: isObscure,
                    showSufficIcon: true,
                    validator: (value) {
                      if (value == null || value.length < 2) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    onToggleVisibility: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  const SizedBox(height: 64),
                  DefaultBlueButton(
                      text: 'Sign in',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          authService.signIn(emailController.text,
                              passwordController.text,);
                        }
                      }),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: mediumTextStyle(FontWeight.w400),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen())),
                          child: Text(
                            'Register',
                            style: mediumTextStyle(FontWeight.w500),
                          ))
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
