import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/cartView.dart';
import 'package:firebase_demo/screens/deleteCart.dart';
import 'package:firebase_demo/screens/itempage.dart';
import 'package:flutter/material.dart';

class CartGridView extends StatefulWidget {
  @override
  _CartGridViewState createState() => _CartGridViewState();
}

class _CartGridViewState extends State<CartGridView> {
  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser;
    double sum = 0;
    print(user);
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

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              primary: false,
              shrinkWrap: true,
              itemCount: document.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.height / 800,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartView(
                                  document[index].data()["name"],
                                  document[index].data()["price"].toDouble(),
                                  document[index].data()["image"],
                                  index,
                                )),
                      );
                    },
                    child: Stack(children: [
                      ListView(physics: ScrollPhysics(), children: [
                        Hero(
                          tag: 'tagImage$index',
                          child: Image.network(
                            "${document[index].data()["image"]}",
                            height: 150,
                          ),
                        ),
                        Center(
                            child: Text(
                                "Price ${document[index].data()["price"]}")),

                        // Text(
                        //     '${document[index].reference.documentID.toString()}')
                        // Text("Hello"),
                      ]),
                      DeleteCartItems(index),
                    ]),
                  ),
                );
              }),
        );
      },
    );
    ;
  }
}
