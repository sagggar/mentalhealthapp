import 'package:flutter/material.dart';
import 'package:mental_health_mobile_application/core/theme/app_color.dart';
import 'package:mental_health_mobile_application/core/theme/custom_texts.dart';
import 'package:typewritertext/typewritertext.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mentalDarkColor,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypeWriterText(
            duration: Duration(milliseconds: 100),
            text: Text(
              CustomText.brand_name,
              style: TextStyle(
                  color: AppColors.mentalBrandColor,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      )),
    );
  }
}
