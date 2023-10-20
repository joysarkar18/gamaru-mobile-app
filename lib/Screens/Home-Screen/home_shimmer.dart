import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 50, 49, 49),
        highlightColor: const Color.fromARGB(255, 99, 98, 98),
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  height: 90,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
                      height: 30,
                      width: 210,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 25, right: 25),
                  height: 170,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  height: 170,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  height: 170,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
