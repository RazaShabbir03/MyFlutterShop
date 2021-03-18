import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Snapshot extends StatelessWidget {
  final uid;
  Snapshot(this.uid);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('Users').doc(uid).snapshots(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var document = snapshot.data;
        return Expanded(
          child: ListView(shrinkWrap: true, children: [
            Center(
                child: Column(children: [
              Text(document['name']),
              Text(document['phone number']),
              Text(document['Time Stamp'].toDate().toString()),
            ])),
          ]),
        );
      },
    );
  }
}
