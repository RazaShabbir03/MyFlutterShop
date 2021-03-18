import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/theuser.dart';
import 'package:firebase_demo/screens/snapshots.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userDetails = '';
  String userName = '';
  String newUserName = '';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController edits = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> inputData() async {
    final User user = await FirebaseAuth.instance.currentUser;
    final String uid = user.uid.toString();
    final String name = user.email.toString();
    setState(() {
      userDetails = uid;
      if (user.email == null) {
        userName = 'Unknown Person';
      } else if (user.email.toString() != null) {
        userName = user.email.toString();
      }
    });
    return uid;
  }

  _printLatestValue() {
    print("Second text field: ${edits.text}");
  }

  @override
  void initState() {
    super.initState();

    edits.addListener(_printLatestValue);
    inputData();
  }

  @override
  void dispose() {
    // Clean up the controller when ther widget is removed from the
    // widget tree.
    edits.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    alertDialog(BuildContext context) {
      // This is the ok button
      Widget ok = TextButton(
        child: Text("Okay"),
        onPressed: () {
          edits.clear();
          Navigator.pop(context);
        },
      );
      // show the alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("I am Here!"),
            content: Text("Data Posted Successfully!"),
            actions: [
              ok,
            ],
            elevation: 5,
          );
        },
      );
    }

    // firestore
    //     .collection('Users')
    //     .add({'name': 'Raza'}).then((value) => print(value.id));
    final user = Provider.of<TheUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Shop'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
      body: Column(children: [
        TextFormField(
          controller: edits,
        ),
        Text(user.uid),
        Text(userDetails),
        Text(userName),
        ElevatedButton(
            child: Text('Feed Information'),
            onPressed: () {
              setState(
                () {
                  firestore.collection('Users').doc(user.uid).set({
                    'name': edits.text,
                    'phone number': '03092948909',
                    'Time Stamp': DateTime.now(),
                  });
                  alertDialog(context);
                },
              );
            }),
        Center(child: Snapshot(user.uid)),
      ]),
    );
  }
}
