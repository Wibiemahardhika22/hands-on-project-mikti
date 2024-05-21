import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:easymart/pages/cart_page.dart';
import 'package:easymart/pages/home_page.dart';
import 'package:easymart/pages/account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 1;

  final pages = <Widget>[
    const CartPage(),
    const HomePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: curvedNavBar(),
      ),
    );
  }

  CurvedNavigationBar curvedNavBar() {
    return CurvedNavigationBar(
      onTap: (index) {
        setState(() {
          this.index = index;
        });
      },
      index: index,
      color: Colors.blue,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.blueAccent,
      height: 60,
      items: const [
        Icon(
          Icons.shopping_cart,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
