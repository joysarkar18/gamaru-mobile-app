import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundStyle extends StatelessWidget {
  final UpperCircleColor1;
  final UpperCircleColor2;
  final LowerCircleColor1;
  final LowerCircleColor2;

  const BackgroundStyle(
      {super.key,
      required this.UpperCircleColor1,
      required this.UpperCircleColor2,
      required this.LowerCircleColor1,
      required this.LowerCircleColor2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Positioned(
            right: Get.width * 0.7,
            top: Get.height * 0.13,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    UpperCircleColor1,
                    UpperCircleColor2,
                  ], 
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.7,
            top: Get.height * 0.68,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    LowerCircleColor1,
                    LowerCircleColor2,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
