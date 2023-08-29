import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Screens/Profile-Screen/profileScreen.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import '../earn_screen.dart';
import 'Home-Screen/homeScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final mainController = Get.put(MainController());

  List<Widget> _pages = [
    EarnScreen(),
    HomeScreen(),
    ProfileScreen1(),
  ];

  @override
  void initState() {
    super.initState();

    mainController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => mainController.is_loading.value
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: LottieBuilder.asset(
              "Assets/loading_home.json",
              frameRate: FrameRate.max,
            )),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: _pages[mainController.navBarIndex.value],
            bottomNavigationBar: EnhancedNavigationBar(
              currentIndex: mainController.navBarIndex.value,
              onTap: (index) {
                mainController.navBarIndex.value = index;
              },
            ),
          ));
  }
}

class EnhancedNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  EnhancedNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   height: 80.0,
        //   color: Colors.white,
        // ),
        GlossyCardDark(
      height: 62.5,
      width: Get.width,
      borderRadius: 0.0,
      borderWith: 0.0000001,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(HeroIcons.fire, "Earn", 0),
            _buildNavItem(Iconsax.game, "Games", 1),
            _buildNavItem(Iconsax.profile_circle, "Profile", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: currentIndex == index ? Colors.green : Colors.white60,

              // size: currentIndex == index ? Size(12, 12) : Size(10, 10),
            ),
            const SizedBox(height: 2.0),
            Text(
              label,
              style: TextStyle(
                color: currentIndex == index ? Colors.green : Colors.white60,
                fontSize: currentIndex == index ? 14 : 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
