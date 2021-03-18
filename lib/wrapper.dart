import 'package:firebase_demo/models/theuser.dart';
import 'package:firebase_demo/screens/Authenticate.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:firebase_demo/screens/mainmenuscreen.dart';
import 'package:firebase_demo/screens/signInAnonScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<TheUser>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return MainMenuScreen();
    }
  }
}
