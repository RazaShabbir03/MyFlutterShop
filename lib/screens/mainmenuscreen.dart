import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/screens/cart.dart';
import 'package:firebase_demo/screens/itempage.dart';
import 'package:firebase_demo/screens/mainMenuGrid.dart';
import 'package:firebase_demo/screens/productScreens/Clothing.dart';
import 'package:firebase_demo/screens/productScreens/groceries.dart';
import 'package:firebase_demo/screens/productScreens/houseHold.dart';
import 'package:firebase_demo/screens/signInAnonScreen.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isPlaying = true;
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 450),
      vsync: this,
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            _handleOnPressed();
          },
          icon: AnimatedIcon(
              color: Colors.grey,
              icon: AnimatedIcons.home_menu,
              progress: _animationController),
        ),
        title: Center(
          child: Text(
            'My Flutter Shop',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 150,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Carousel(
                      boxFit: BoxFit.cover,
                      autoplayDuration: Duration(seconds: 3),
                      autoplay: true,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 1000),
                      dotSize: 6.0,
                      dotIncreasedColor: Colors.white,
                      dotBgColor: Colors.transparent,
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: 5.0,
                      showIndicator: true,
                      indicatorBgPadding: 7.0,
                      borderRadius: true,
                      images: [
                        NetworkImage(
                            "https://icms-image.slatic.net/images/ims-web/3c42bb48-1f49-4d72-abab-ddc047d3e1db.jpg_1200x1200.jpg"),
                        NetworkImage(
                            "https://icms-image.slatic.net/images/ims-web/b305f7f9-0837-4949-aed3-058574a55d10.jpg"),
                        NetworkImage(
                            "https://icms-image.slatic.net/images/ims-web/2c9e2bb1-224c-4e74-89f3-7e6f0dc02db3.jpg"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Groceries()),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          height: 300,
                          child: Column(children: [
                            Image.network(
                              "https://icms-image.slatic.net/images/ims-web/808352fd-4cc2-4e75-b1f1-04096b41c3a7.gif",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text('Groceries',
                                    style: TextStyle(
                                      fontSize: 32,
                                    )),
                                // "https://icms-image.slatic.net/images/ims-web/c4996812-5311-4450-9df5-45bb2dba26a0.gif",
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Clothing()),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          height: 300,
                          child: Column(children: [
                            Image.network(
                              "https://icms-image.slatic.net/images/ims-web/c4996812-5311-4450-9df5-45bb2dba26a0.gif",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text('Clothing',
                                    style: TextStyle(
                                      fontSize: 32,
                                    )),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HouseHold()),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          height: 300,
                          child: Column(children: [
                            Image.network(
                              "https://icms-image.slatic.net/images/ims-web/3596ac26-8b05-4dec-8dbb-a7d7dc12c9b0.gif",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text('House Hold',
                                    style: TextStyle(
                                      fontSize: 32,
                                    )),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Container(
                        height: 300,
                        child: Column(children: [
                          Image.network(
                            "https://icms-image.slatic.net/images/ims-web/d5b3eb57-2683-43da-934e-4317596967d8.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Text('QR Scan',
                                  style: TextStyle(
                                    fontSize: 32,
                                  )),
                              //
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Flash Sale',
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            MainMenuScreen2(),
            // Container(
            //   child: GridView.builder(
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //       ),
            //       itemCount: 9,
            //       itemBuilder: (context, index) {
            //         return Card(
            //             child: GridTile(
            //           header: Text(
            //             'Hello',
            //             style: TextStyle(fontSize: 50),
            //           ),
            //           child: Text(index.toString()),
            //         ));
            //       }),
            // )
          ]),
        ),
      ),
    );
  }
}
