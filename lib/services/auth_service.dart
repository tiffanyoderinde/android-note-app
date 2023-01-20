import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffany/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AuthService {
  checkAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  Future<void> signIn(String email, String password,) =>
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => print('signed in'))
          .onError((error, stackTrace) {
        print(error);
      });

  Future<void> signUp(String email, String password, String fullName,
          String phoneNumber, BuildContext context) =>
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        final user = FirebaseAuth.instance.currentUser;
        FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
          "Uid": user.uid,
          "FullName": fullName,
          "Email": email,
          "PhoneNumber": phoneNumber,
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }).onError((error, stackTrace) {
        print(error);
      });

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool validateEmail(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }
}
