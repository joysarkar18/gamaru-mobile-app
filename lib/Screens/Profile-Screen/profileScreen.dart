import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/background_style.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Componants/glossy_prof.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/addMoney.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/transaction-screen.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/withdrawl.dart';
import 'package:gamaru_mobile_app/Screens/app_update/update_screen.dart';
import 'package:gamaru_mobile_app/Screens/coins-exchange-screen/exchange_screen.dart';
import 'package:gamaru_mobile_app/Screens/notifications-screen/notification.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../Controllers/Login-Contollers/autehntication.dart';
import '../Customer Support/SupportScreen.dart';
import '../refer_screen/refer_earn_screen.dart';

class ProfileScreen1 extends StatelessWidget {
  const ProfileScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
    final walletController = Get.put(WalletController());
    walletController.myWalletStatus.value = false;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/bg_profile.JPG"),
                    fit: BoxFit.cover)),
          ),
          GlossyCardDarkProf(
            height: Get.height * 0.7,
            width: Get.width,
            borderRadius: 30.0,
            borderWith: 0.0,
            child: Container(),
          ),
          Positioned(
              top: Get.height - Get.height * 0.85,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8.0, // soften the shadow
                        spreadRadius: 0.2, //extend the shadow
                      )
                    ],
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(75))),
                child: RandomAvatar(
                  authentication.userEmail.value,
                ),
              )),
          Positioned(
            top: Get.height - Get.height * 0.65,
            child: SizedBox(
              width: Get.width - 60,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            authentication.userEmail.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: walletController.myWalletStatus.value
                            ? 250.0
                            : 50.0,
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                walletController.myWalletStatus.value =
                                    !walletController.myWalletStatus.value;
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    HeroIcons.wallet,
                                    color: Colors.white70,
                                    size: 35,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "My Wallet",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: Get.width * .35,
                                  ),
                                  walletController.myWalletStatus.value
                                      ? const Icon(
                                          Icons.arrow_drop_up_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        )
                                      : const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        )
                                ],
                              ),
                            ),
                            walletController.myWalletStatus.value
                                ? Divider()
                                : const Text(
                                    "",
                                    style: TextStyle(fontSize: 0),
                                  ),
                            walletController.myWalletStatus.value
                                ? Container(
                                    child: Column(children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => AddMoney());
                                        },
                                        child: const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              HeroIcons.bolt,
                                              color: Colors.white70,
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Recharge",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const ExchangeScreen());
                                        },
                                        child: const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              HeroIcons.forward,
                                              color: Colors.white70,
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Exchange",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => WithdrawScreen());
                                        },
                                        child: const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              HeroIcons.banknotes,
                                              color: Colors.white70,
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Withdraw",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => TransactionScreen());
                                        },
                                        child: const Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              HeroIcons.bars_arrow_down,
                                              color: Colors.white70,
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Transactions",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  )
                                : const Text(
                                    "",
                                    style: TextStyle(fontSize: 0),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(ReferAndEarn());
                      },
                      child: GlossyCard(
                        height: 50.0,
                        width: Get.width,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              HeroIcons.chat_bubble_bottom_center_text,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Refer & Earn",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(const Notifications());
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.notifications_rounded,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Notifications",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(SupportScreen());
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.headphones,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Customer Support",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        authentication.logOut();
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
