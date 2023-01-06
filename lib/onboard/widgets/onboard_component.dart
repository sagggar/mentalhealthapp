import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/custom_texts.dart';

class OnboardTemplate extends StatelessWidget {
  final PageController pageController;
  final String image;
  final String subTitle1;
  final String subTitle2;
  final String buttonText;
  final VoidCallback onPressed;
  final VoidCallback skipBtnPressed;

  const OnboardTemplate({
    Key? key,
    required this.pageController,
    required this.image,
    required this.buttonText,
    required this.subTitle1,
    required this.subTitle2,
    required this.onPressed,
    required this.skipBtnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: skipBtnPressed,
                child: Text(
                  CustomText.skipText,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline3,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 360.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 16,
          ),
          SmoothPageIndicator(
              controller: pageController, // PageController
              count: 2,
              effect: WormEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  activeDotColor:
                      AppColors.mentalBrandColor), // your preferred effect
              onDotClicked: (index) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }),
          Padding(
            padding: EdgeInsets.only(right: 128.0, top: 32.0),
            child: RichText(
              text: TextSpan(
                  text: subTitle1,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 22.0, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: subTitle2,
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.mentalOnboardTextColor))
                  ]),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.mentalBrandColor),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.mentalBrandLightColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
