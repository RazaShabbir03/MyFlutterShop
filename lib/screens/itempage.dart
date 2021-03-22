import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/cart.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final int index;
  ItemPage(this.name, this.price, this.image, this.index);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
          widget.name,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: 'tagImage${widget.index}',
              child: Image.network(widget.image),
            ),
            Text('${widget.price.toString()} Rs.'),
            ElevatedButton(
              onPressed: () {
                setState(() async {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  final User user = await FirebaseAuth.instance.currentUser;
                  firestore
                      .collection('Users')
                      .doc(user.uid)
                      .collection('Cart')
                      .doc()
                      .set({
                    'name': widget.name,
                    'price': widget.price,
                    'image': widget.image,
                  });
                });
              },
              child: Text('Add to cart'),
            )
          ],
        ),
      ),
    );
  }
}
