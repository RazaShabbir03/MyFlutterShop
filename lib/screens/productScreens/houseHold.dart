import 'package:flutter/material.dart';

class HouseHold extends StatelessWidget {
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
          'House Hold',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
