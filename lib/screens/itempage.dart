import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String name;
  final String image;
  final int price;
  final int index;
  ItemPage(this.name, this.price, this.image, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Hero(
            tag: 'tagImage$index',
            child: Image.network(image),
          ),
          Text(price.toString()),
        ],
      ),
    );
  }
}
