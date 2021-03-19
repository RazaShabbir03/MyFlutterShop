import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/cartItems.dart';
import 'package:firebase_demo/screens/cartGridView.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String name;
  final double price;
  final String image;

  Cart({this.name, this.price, this.image});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<CartItems> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: CartGridView(),
    );
  }
}
