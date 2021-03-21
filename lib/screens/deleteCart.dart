import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeleteCartItems extends StatelessWidget {
  final int index;
  DeleteCartItems(this.index);
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Cart')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var document = snapshot.data.docs;

          return IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(user.uid)
                    .collection('Cart')
                    .where('name', isEqualTo: document[index].data()["name"])
                    .get()
                    .then((snapshot) {
                  snapshot.docs.first.reference.delete();
                });
              });
        });
  }
}
