import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/screens/itempage.dart';
import 'package:flutter/material.dart';

class MainMenuScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('admin-listings')
          .doc('flash-sales')
          .collection('details')
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var document = snapshot.data.docs;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              primary: false,
              shrinkWrap: true,
              itemCount: document.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.height / 800,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemPage(
                                  document[index].data()["name"],
                                  document[index].data()["price"],
                                  document[index].data()["image"],
                                  index,
                                )),
                      );
                    },
                    child: ListView(physics: ScrollPhysics(), children: [
                      Hero(
                        tag: 'tagImage$index',
                        child: Image.network(
                          "${document[index].data()["image"]}",
                          height: 150,
                        ),
                      ),
                      Center(
                          child:
                              Text("Price ${document[index].data()["price"]}")),
                      // Text("Hello"),
                    ]),
                  ),
                );
              }),
        );
      },
    );
  }
}
