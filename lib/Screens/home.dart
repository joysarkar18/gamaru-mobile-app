import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(color: Colors.pink, Icons.favorite_rounded),
              onPressed: () => {print("I Love You")}),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.red),
                  "PINK iS RARE"))
        ],
      )),
    );
  }
}
