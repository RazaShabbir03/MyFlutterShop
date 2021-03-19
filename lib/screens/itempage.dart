import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final int index;
  ItemPage(this.name, this.price, this.image, this.index);
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
          name,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: 'tagImage$index',
              child: Image.network(image),
            ),
            Text('${price.toString()} Rs.'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to cart'),
            )
          ],
        ),
      ),
    );
  }
}
