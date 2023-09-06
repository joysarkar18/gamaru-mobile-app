import 'package:flutter/material.dart';

class IdPass extends StatelessWidget {
  const IdPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white70),
          title: const Text(
            "BGMI SQUAD MATCH",
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
          )),
    );
  }
}
