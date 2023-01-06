import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_mobile_application/auth/application/auth_controller.dart';
import 'package:mental_health_mobile_application/utils/extentions_utils.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/custom_texts.dart';
import '../../user_interface/custom_buttons.dart';
import '../../user_interface/custom_input_fields.dart';
import '../../user_interface/custom_modals.dart';
import '../../user_interface/custom_text.dart';
import '../../user_interface/spacing.dart';
import '../../utils/focus.helper.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final AuthController authController = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();

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
                    text: CustomText.mentalSignUpText,
                    context: context,
                  ),
                  customSizedBox(context: context, size: 0.04),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomInputTextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (String? value) {
                            if (value!.isValidEmail == false) {
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
                            if (value!.isValidPassword == false) {
                              return CustomErrorText.invalidPassword;
                            }
                            return null;
                          },
                        ),
                        customSizedBox(context: context, size: 0.12),
                        Obx(
                          () => AbsorbPointer(
                            absorbing: authController.disableSignUpbutton.value,
                            child: CustomBtn(
                              onPressed: () => {
                                if (formKey.currentState!.validate())
                                  {
                                    authController.registerWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                  }
                              },
                              buttonText: CustomText.mentalSignUpText,
                            ),
                          ),
                        ),
                        customSizedBox(context: context, size: 0.1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CustomText.mentalSignUpHaveAcctText,
                              style: Theme.of(context).textTheme.button,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/login'),
                              child: Text(
                                CustomText.mentalSignInText,
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      color: AppColors.mentalBrandColor,
                                      fontWeight: FontWeight.w700,
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
