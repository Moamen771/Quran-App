import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/screens/prayer_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [HomeScreen(), QuranScreen(), PrayerScreen()];
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: AppColors.darkGreen,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.menu_book_outlined, size: 30, color: Colors.white),
          Icon(Icons.timer, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          screenIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
