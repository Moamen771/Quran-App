import 'package:flutter/material.dart';

import 'boarding_page.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),
      child: PageView(
        controller: pageController,
        children: [
          BoardingPage(
            title: '!مرحبا',
            txt: 'ابدأ رحلتك في حفظ القران بسهولة',
            image: 'assets/onboarding2.jpeg',
          ),
          BoardingPage(
            title: '!تذكير',
            txt: 'مواعيد الصلاة',
            image: 'assets/onboarding1.jpg',
          ),
          BoardingPage(
            title: 'الأن لنبدأ',
            txt: 'Next اضغط علي  ',
            image: 'assets/onborading3.jpg',
          ),
        ],
      ),
    );
  }
}
