import 'package:flutter/material.dart';
import 'package:quran_app/models/radio_item.dart';
import '../../constants/app_colors.dart';

class RadioItemContainer extends StatelessWidget {
  const RadioItemContainer({super.key, required this.radioItem});

  final RadioItem radioItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        radioItem.playSound();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
            ),
            Expanded(
              child: Text(
                radioItem.name,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              radioItem.id.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Image.asset(
              'assets/radio-icon.png',
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
