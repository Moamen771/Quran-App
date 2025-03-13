import 'package:flutter/material.dart';
import 'package:quran_app/widegts/prayer%20widgets/prayer_time.dart';

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 160),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: PrayerTime(),
    );
  }
}
