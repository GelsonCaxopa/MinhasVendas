import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      if (FirebaseAuth.instance.currentUser == null) {
        // user not logged ==> Login Screen
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // user already logged in ==> Home Screen

        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset("./assets/GIF.gif"),
        ),
      ),
    );
  }
}
