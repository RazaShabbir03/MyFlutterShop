import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:firebase_demo/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/theuser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'My FLutter Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyFlutterShop(),
      ),
    );
  }
}

class MyFlutterShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}
