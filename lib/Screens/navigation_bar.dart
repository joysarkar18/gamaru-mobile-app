import 'package:flutter/material.dart';
import '../earn_screen.dart';
import '../game_screen.dart';
import '../profile_screen.dart';
import 'Home-Screen/homeScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  List<Widget> _pages = [
    EarnScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: EnhancedNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
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
        Container(
      decoration: BoxDecoration(
        // border: Border.all(
        //   strokeAlign: 0.1,
        // ),
        // backgroundBlendMode: BlendMode.color,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),

        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [const Color.fromARGB(255, 7, 66, 113), Colors.purple]),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 31, 9, 120).withOpacity(0.79),
            blurRadius: 25.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.currency_rupee_rounded, "Earn", 0),
          _buildNavItem(Icons.games_rounded, "Games", 1),
          _buildNavItem(Icons.person_rounded, "Profile", 2),
        ],
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
              color: currentIndex == index ? Colors.white : Colors.white38,

              // size: currentIndex == index ? Size(12, 12) : Size(10, 10),
            ),
            SizedBox(height: 2.0),
            Text(
              label,
              style: TextStyle(
                color: currentIndex == index ? Colors.white : Colors.white38,
                fontSize: currentIndex == index ? 14 : 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
