import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mental_health_mobile_application/auth/application/auth_controller.dart';
import 'package:mental_health_mobile_application/onboard/application/onboarding_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {
    await initializeFirebase();
    Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<WelcomeController>(WelcomeController());
    Get.put<OnboardingController>(OnboardingController());
  }

  Future initializeFirebase() async {
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: true);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance,
        fenix: true);
  }
}
