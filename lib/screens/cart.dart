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

// final User user = await FirebaseAuth.instance.currentUser;
double sum = 0;
bool _loading = true;

class _CartState extends State<Cart> {
  final List<CartItems> cartItems = [];
  Future<double> queryValues() async {
    double total = 0.0;
    final FirebaseAuth auth = await FirebaseAuth.instance;
    final User user = auth.currentUser;
//User user= await _auth.currentUser();
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('Cart')
        .get()
        .then((sums) => sums.docs.forEach((value) {
              total = total + value.data()['price'];
            }))
        .then((value) => setState(() {
              sum = total;
              _loading = false;
            }));

    return total;
  }

  //Future<double> phoneOfPatient =

  @override
  Widget build(BuildContext context) {
    queryValues();
    return _loading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
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
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartGridView(),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(25),
                          child: Text("Total: ${sum.toInt()} Rupees",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))))
                ]),
          );
  }
}
