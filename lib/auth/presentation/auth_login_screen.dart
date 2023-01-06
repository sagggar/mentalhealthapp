import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_mobile_application/core/theme/app_color.dart';
import 'package:mental_health_mobile_application/core/theme/custom_texts.dart';
import 'package:mental_health_mobile_application/user_interface/custom_input_fields.dart';
import 'package:mental_health_mobile_application/user_interface/custom_text.dart';
import 'package:mental_health_mobile_application/utils/focus.helper.dart';
import 'package:mental_health_mobile_application/user_interface/spacing.dart';

import '../../user_interface/custom_buttons.dart';
import '../../user_interface/custom_modals.dart';
import '../application/auth_controller.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final AuthController authController = Get.put(AuthController());
  final loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context: context);
      },
      child: Scaffold(
        backgroundColor: AppColors.mentalBrandLightColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomSpacing.kHorizontalPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSizedBox(context: context, size: 0.15),
                  Obx(
                    () => authController.disableSignInbutton.value
                        ? showSpinner()
                        : Container(),
                  ),
                  mainHeading(
                    text: CustomText.mentalSignInText,
                    context: context,
                  ),
                  customSizedBox(context: context, size: 0.04),
                  Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        CustomInputTextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return CustomErrorText.invalidEmail;
                            }
                            return null;
                          },
                        ),
                        CustomInputPassword(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscuringCharacter: '*',
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return CustomErrorText.invalidPassword;
                            }
                            return null;
                          },
                        ),
                        customSizedBox(context: context, size: 0.013),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed('/forgot-password'),
                              child: Text(
                                CustomText.mentalForgotPasswordText,
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.button,
                              ),
                            )
                          ],
                        ),
                        customSizedBox(context: context, size: 0.12),
                        Obx(
                          () => AbsorbPointer(
                            absorbing: authController.disableSignInbutton.value,
                            child: CustomBtn(
                              onPressed: () => {
                                if (loginFormKey.currentState!.validate())
                                  {
                                    authController.signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                  }
                              },
                              buttonText: CustomText.mentalSignInText,
                            ),
                          ),
                        ),
                        customSizedBox(context: context, size: 0.1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CustomText.mentalSignInNoAcctText,
                              style: Theme.of(context).textTheme.button,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/signup'),
                              child: Text(
                                CustomText.mentalSignUpText,
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      color: AppColors.mentalBrandColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
