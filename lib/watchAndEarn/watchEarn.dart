import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

class WatchAndEarn extends StatefulWidget {
  const WatchAndEarn({super.key});

  @override
  State<WatchAndEarn> createState() => _WatchAndEarnState();
}

class _WatchAndEarnState extends State<WatchAndEarn> {
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
                onAdClicked: (ad) {});

            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
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
            GlossyCard(
              height: 100.0,
              width: 200.0,
              borderRadius: 20.0,
              borderWith: 2.0,
              child: ElevatedButton(
                child: Text("WATCH"),
                onPressed: () {
                  _rewardedAd!.show(
                    onUserEarnedReward: (ad, reward) {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
