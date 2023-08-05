// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyCardDarkProf extends StatelessWidget {
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

  const GlossyCardDarkProf({
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
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius)),
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50.0,
              sigmaY: 52.5,
            ),
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius)),
                border: Border.all(
                  width: borderWith,
                  color: Colors.black.withOpacity(0.43),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 19, 2, 31).withOpacity(0.353),
                      Color.fromARGB(255, 15, 0, 18).withOpacity(0.203),
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
