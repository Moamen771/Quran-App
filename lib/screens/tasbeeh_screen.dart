import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lighterGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          FittedBox(
            child: Text(
              counter.toString(),
              style: TextStyle(color: Colors.black, fontSize: 120),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => setState(() {
                  if (counter > 0) {
                    counter--;
                  }
                }),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  foregroundColor: Colors.white,
                  iconSize: 80,
                ),
                icon: Icon(Icons.remove),
              ),
              IconButton(
                  onPressed: () => setState(() {
                        counter++;
                      }),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.darkGreen,
                    foregroundColor: Colors.white,
                    iconSize: 80,
                  ),
                  icon: Icon(Icons.add)),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () => setState(() {
              counter = 0;
            }),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.darkGreen,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              iconSize: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            label: Text(
              'Reset',
              style: TextStyle(fontSize: 24),
            ),
            icon: Icon(
              Icons.replay,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
