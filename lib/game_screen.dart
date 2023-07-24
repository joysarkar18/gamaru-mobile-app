import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actionsIconTheme: IconThemeData(color: Colors.amber)),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background/Untitled design.jpeg"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: (Text("Games Page"))),
            ],
          ),
        ),
      ),
    );
  }
}
