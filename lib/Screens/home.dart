import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(color: Colors.pink, Icons.favorite_rounded),
              onPressed: () => {print("I Love You")}),
          Text("PINK iS RARE")
        ],
      )),
    );
  }
}
