import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/cart.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final int index;

  CartView(this.name, this.price, this.image, this.index);
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
                        builder: (BuildContext context) => Cart()));
                  }),
              elevation: 0,
              title: Text(
                'Cart',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
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
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(user.uid)
                          .collection('Cart')
                          .where('name',
                              isEqualTo: document[widget.index].data()["name"])
                          .get()
                          .then((snapshot) {
                        snapshot.docs.first.reference.delete();
                        setState(() {
                          Navigator.pop(context);
                        });
                      });
                    },
                    child: Text('Remove from cart'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
