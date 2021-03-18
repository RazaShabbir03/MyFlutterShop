import 'package:flutter/material.dart';

class Clothing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Clothing',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
