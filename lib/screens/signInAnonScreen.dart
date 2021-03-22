import 'package:firebase_demo/screens/mainmenuscreen.dart';
import 'package:firebase_demo/screens/signUp.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';

class SignInAnonScreen extends StatefulWidget {
  final Function toggleView;
  SignInAnonScreen({this.toggleView});
  @override
  _SignInAnonScreenState createState() => _SignInAnonScreenState();
}

class _SignInAnonScreenState extends State<SignInAnonScreen> {
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
            appBar: AppBar(
              automaticallyImplyLeading: false,
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(child: Text('Sign In')),
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
                child: Text('Sign In'),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  await _auth.signInWithEmailAndPassword(email, password);
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _loading = true;
                    });
                    await _auth.signInAnon();
                  },
                  child: Text('Sign In Anon'),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.toggleView();
                    });
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ]),
          );
  }
}
