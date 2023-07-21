import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyCard extends StatelessWidget {
  final height;
  final width;
  final borderRadius;
  final child;
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
                      Color.fromARGB(255, 125, 125, 125).withOpacity(0.003),
                      Color.fromARGB(255, 112, 112, 112).withOpacity(0.003),
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
