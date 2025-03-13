import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/models/surah.dart';

class QuranContainer extends StatelessWidget {
  const QuranContainer({super.key, required this.surah});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            surah.revelationType == "Meccan" ? 'مكيّة' : 'مدنية',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            surah.numberOfAyahs.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            surah.arName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Image.asset(
            'assets/quran_icon.png',
            height: 40,
          ),
        ],
      ),
    );
  }
}
