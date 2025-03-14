import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/ayah.dart';

class AyahContainer extends StatelessWidget {
  const AyahContainer({super.key, required this.ayah});

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.lighterGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${ayah.text} ${ayah.numberInSurah}',
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
