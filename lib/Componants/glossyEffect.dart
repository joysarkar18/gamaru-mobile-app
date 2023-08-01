// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final height;
  // ignore: prefer_typing_uninitialized_variables
  final width;
  // ignore: prefer_typing_uninitialized_variables
  final borderRadius;
  // ignore: prefer_typing_uninitialized_variables
  final child;
  // ignore: prefer_typing_uninitialized_variables
  final borderWith;

  const GlossyCard({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.child,
    required this.borderWith,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 24.0,
              sigmaY: 23.5,
            ),
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: borderWith,
                  color: Colors.white.withOpacity(0.43),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 107, 106, 106).withOpacity(0.153),
                      Color.fromARGB(255, 88, 88, 88).withOpacity(0.103),
                    ])),
          ),
          Center(
            child: Container(
              child: child,
            ),
          )
        ]),
      ),
    );
  }
}
