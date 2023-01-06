import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mental_health_mobile_application/binding/main_binding.dart';
import 'package:mental_health_mobile_application/core/theme/mental_health_theme.dart';
import 'package:mental_health_mobile_application/launch_screen/presentation/welcome_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      initialBinding: MainBinding(),
      title: 'Mental Health Application',
      theme: mentalHealthThemeLight,
      darkTheme: mentalHealthThemeDark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: const WelcomeScreen(),
    );
  }
}
