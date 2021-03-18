import 'package:flutter/material.dart';

class HouseHold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'House Hold Items',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
