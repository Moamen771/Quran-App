import 'package:flutter/material.dart';
import 'package:quran_app/widegts/onboarding%20widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int pageIndex = 1;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody(
        pageController: pageController,
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                pageController.jumpToPage(2);
                pageIndex = 2;
              },
              child: Text('Skip'),
            ),
            SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                    dotColor: Colors.grey, activeDotColor: Colors.green),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  index = pageIndex;
                }),
            TextButton(
              onPressed: () {
                pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: Text(pageIndex == 3 ? 'Get Started' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
