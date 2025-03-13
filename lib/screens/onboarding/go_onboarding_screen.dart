import 'package:flutter/material.dart';
import 'package:quran_app/screens/onboarding/onboarding_screen.dart';

class GoOnboardingScreen extends StatelessWidget {
  const GoOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(24, 99, 81, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/quran_img.png'),
            ),
            Text(
              'Quran',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(135, 209, 164, 1),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreen(),
                  )),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(135, 209, 164, 1),
                  foregroundColor: Color.fromRGBO(24, 99, 81, 1),
                  minimumSize: Size(200, 60)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 24,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
