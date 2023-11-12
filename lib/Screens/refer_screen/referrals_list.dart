import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:get/get.dart';

class ReferralsList extends StatelessWidget {
  const ReferralsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            //-----------------------PENDING----------------------------
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GlossyCard(
                borderRadius: 10.0,
                borderWith: 1.0,
                height: 80.0,
                width: Get.width,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.white38,
                  ),
                  title: Text(
                    'example@email.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white60),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pending',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Ask your friend to make his/her first recharge',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Colors.orange),
                  ),
                ),
              ),
            );

            //-----------------------successful----------------------------
            // return Padding(
            //   padding: const EdgeInsets.all(6.0),
            //   child: GlossyCard(
            //     borderRadius: 10.0,
            //     borderWith: 1.0,
            //     height: 80.0,
            //     width: Get.width,
            //     child: ListTile(
            //       leading: Icon(
            //         Icons.email,
            //         color: Colors.white38,
            //       ),
            //       title: Text(
            //         'example@email.com',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 16,
            //             color: Colors.white60),
            //       ),
            //       trailing: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             'Successful',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w400,
            //                 fontStyle: FontStyle.italic,
            //                 fontSize: 14,
            //                 color: Colors.green),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
