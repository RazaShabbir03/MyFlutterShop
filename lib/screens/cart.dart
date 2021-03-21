import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/cartItems.dart';
import 'package:firebase_demo/screens/cartGridView.dart';
import 'package:firebase_demo/screens/mainmenuscreen.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  Cart({this.name, this.price, this.image});

  @override
  _CartState createState() => _CartState();
}

final User user = FirebaseAuth.instance.currentUser;
double sum = 0;

class _CartState extends State<Cart> {
  final List<CartItems> cartItems = [];
  Future<double> queryValues() async {
    double total = 0.0;

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('Cart')
        .get()
        .then((sums) => sums.docs.forEach((value) {
              total = total + value.data()['price'];
            }))
        .then((value) => setState(() => sum = total));

    return total;
  }

  //Future<double> phoneOfPatient =

  @override
  Widget build(BuildContext context) {
    queryValues();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => MainMenuScreen()));
            }),
        elevation: 0,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: Column(children: [CartGridView(), Text("Total: $sum")]),
    );
  }
}
