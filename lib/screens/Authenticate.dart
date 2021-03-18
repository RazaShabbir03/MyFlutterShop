import 'package:firebase_demo/models/theuser.dart';
import 'package:firebase_demo/screens/signInAnonScreen.dart';
import 'package:firebase_demo/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInAnonScreen(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
