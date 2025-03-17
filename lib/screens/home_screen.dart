import 'package:flutter/material.dart';
import 'package:quran_app/constants/app_colors.dart';
import 'package:quran_app/screens/radio_screen.dart';
import 'package:quran_app/screens/tasbeeh_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.darkGreen,
                    AppColors.lightGreen,
                  ],
                ),
              ),
              child: Row(
                spacing: 20,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 5,
                    children: [
                      Text(
                        'Last Read',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                      Text(
                        'سُورَةُ ٱلْفَاتِحَةِ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        'Ayah no 1',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black),
                          child: Row(
                            spacing: 10,
                            children: [
                              Text('Continue'),
                              Icon(Icons.arrow_forward)
                            ],
                          ))
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/quran_img.png',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12.0),
              child: Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TasbeehScreen(),
                          )),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tasbeeh',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/tasbih-icon.png',
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RadioScreen(),
                          )),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Eslamic Radio',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/radio-icon.png',
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
