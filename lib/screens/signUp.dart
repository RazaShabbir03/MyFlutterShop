import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:firebase_demo/screens/signInAnonScreen.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:firebase_demo/wrapper.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  bool _loading = false;
  String email = '';
  String password = '';
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return _loading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(child: Text('Sign Up')),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  await _auth.createUserWithEmailAndPassword(email, password);
                },
              ),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                    widget.toggleView();
                  });
                },
              ),
            ]),
          );
  }
}
