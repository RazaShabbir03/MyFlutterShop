import 'package:flutter/material.dart';

class Groceries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Groceries',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
