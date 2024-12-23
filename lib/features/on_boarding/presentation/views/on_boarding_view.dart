import 'package:flutter/material.dart';
import 'package:plant_care_ut/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';



class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingViewBody(pageController: pageController,),
    );
  }
}
