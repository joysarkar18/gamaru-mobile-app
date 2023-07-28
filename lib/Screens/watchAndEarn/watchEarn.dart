import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/AdController/adController.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class WatchAndEarn extends StatefulWidget {
  const WatchAndEarn({super.key});

  @override
  State<WatchAndEarn> createState() => _WatchAndEarnState();
}

class _WatchAndEarnState extends State<WatchAndEarn> {
  AdController adController = Get.put(AdController());
  final adUnitId = 'ca-app-pub-3940256099942544/5224354917';
  RewardedAd? _rewardedAd = null;

  @override
  void initState() {
    print("injksdhskjadhsajkdhsajkdhskjdsakjdh");
    super.initState();
    RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {
                  print("user click on ad");
                });

            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
            adController.ad_isLoading.value = true;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Watch and Earn",
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.white70)),
      body: Container(
        width: Get.width,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 230,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/wathandEarnPhoto.jpg"))),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.yellow, width: 1),
                            color: Colors.black),
                        child: const Text(
                          "HOW TO EARN?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.yellow, width: 1),
                        ),
                        child: const Text(
                          "TERMS & CONDITIONS",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "TOTAL EARNING",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            GlossyCard(
              height: 50.0,
              width: 100.0,
              borderRadius: 26.0,
              borderWith: 2.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LottieBuilder.asset(
                          "Assets/coin.json",
                          animate: false,
                          fit: BoxFit.cover,
                          height: 22,
                          width: 22,
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        const Text(
                          "100",
                          style: TextStyle(color: Colors.yellow, fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    LottieBuilder.asset(
                      "Assets/adWatch.json",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "WATCH",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                LottieBuilder.asset(
                  "Assets/rightArrow.json",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    LottieBuilder.asset(
                      "Assets/coin.json",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      frameRate: FrameRate.max,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "EARN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                LottieBuilder.asset(
                  "Assets/rightArrow.json",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    LottieBuilder.asset(
                      "Assets/play.json",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "PLAY",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Watch more to earn more!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _rewardedAd!.show(
                  onUserEarnedReward: (ad, reward) {},
                );
              },
              child: Container(
                  height: 40,
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.yellow, width: 1),
                  ),
                  child: Obx(() => adController.ad_isLoading.value
                      ? const Center(
                          child: Text(
                            "WATCH NOW",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : LottieBuilder.asset(
                          "Assets/adlod.json",
                          height: 40,
                          width: 40,
                        ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Column(
                children: [
                  Text(
                    "*NOTE - You have to click the install button after finishing the ad to ensure the reward.",
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "*(don't need to install the app just visit it in the play store)",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
