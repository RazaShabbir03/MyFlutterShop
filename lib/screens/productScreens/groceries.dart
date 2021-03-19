import 'package:firebase_demo/screens/productScreens/groceriesGridView.dart';
import 'package:flutter/material.dart';

class Groceries extends StatelessWidget {
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
          'Groceries',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GroceriesGridView(),
    );
  }
}
