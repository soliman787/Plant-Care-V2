import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/on_boarding_info_model.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  const OnBoardingPageIndicator({super.key, required this.pageController,required this.controller});
  final PageController pageController;
  final List<OnBoardingInfoModel> controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: controller.length,
      effect: const WormEffect(
        activeDotColor: Color(0xFF006210),
        dotColor: Color(0xFFD9D9D9),
        dotHeight: 12.21,
        dotWidth: 12.21,
        type: WormType.thinUnderground,
      ),
    );  }
}
