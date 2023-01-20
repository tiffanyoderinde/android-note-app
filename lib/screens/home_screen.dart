import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/auth_service.dart';
import 'package:tiffany/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen'),
              TextButton(
                onPressed: () async {
                  AuthService().signOut();
                },
                child: Text('Sign out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
