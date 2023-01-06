import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_mobile_application/onboard/application/onboarding_controller.dart';
import 'package:mental_health_mobile_application/onboard/widgets/onboard_component.dart';

import '../../core/theme/brand_image.dart';
import '../../core/theme/custom_texts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardingController _controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: PageView(
        controller: _controller.pageController,
        children: [
          OnboardTemplate(
            pageController: _controller.pageController,
            image: BrandImages.kOnboardScreen1Img,
            subTitle1: CustomText.onboardScreenText1,
            subTitle2: CustomText.onboardScreenText2,
            buttonText: CustomText.onboardScreenBtn1,
            onPressed: _controller.nextPage,
            skipBtnPressed: () => Get.offAllNamed('/login'),
          ),
          OnboardTemplate(
            pageController: _controller.pageController,
            image: BrandImages.kOnboardScreen2Img,
            subTitle1: CustomText.onboardScreen2Text1,
            subTitle2: CustomText.onboardScreen2Text2,
            buttonText: CustomText.onboardScreenBtn2,
            onPressed: _controller.nextPage,
            skipBtnPressed: () => Get.offAllNamed('/login'),
          ),
        ],
      )),
    );
  }
}
