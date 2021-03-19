import 'package:firebase_demo/screens/productScreens/clothingGridView.dart';
import 'package:flutter/material.dart';

class Clothing extends StatelessWidget {
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
          'Clothing',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      body: ClothingGridView(),
    );
  }
}
