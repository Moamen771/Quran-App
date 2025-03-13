import 'package:flutter/material.dart';
import 'package:quran_app/widegts/prayer%20widgets/prayer_container.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/muslim_img3.jpg'),
                    fit: BoxFit.cover)),
            child: Text(
              'مواقيت الصلاة',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          PrayerContainer()
        ],
      ),
    );
  }
}
