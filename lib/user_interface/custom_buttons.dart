import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color? btnColor;
  final Color? textColor;
  const CustomBtn(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.btnColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0, bottom: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: btnColor ?? AppColors.mentalBrandColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
              color: textColor ?? AppColors.mentalBrandLightColor,
            ),
          ),
        ),
      ),
    );
  }
}
