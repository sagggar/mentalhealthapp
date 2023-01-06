// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDzB-J0iZzz0y3o_-Mep-gliFU6GM5ifL4',
    appId: '1:63387157073:web:17b428109952ce6c922e70',
    messagingSenderId: '63387157073',
    projectId: 'mental-health-care-d673d',
    authDomain: 'mental-health-care-d673d.firebaseapp.com',
    storageBucket: 'mental-health-care-d673d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBom7eBSHYwiuWeSIMCBxdDtH5e-wFSVQI',
    appId: '1:63387157073:android:87ffbe12526f6b7d922e70',
    messagingSenderId: '63387157073',
    projectId: 'mental-health-care-d673d',
    storageBucket: 'mental-health-care-d673d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_k2P_aHVW5lvPVFPWqtFeLQSQKtMmyzU',
    appId: '1:63387157073:ios:d37b1a7162246d39922e70',
    messagingSenderId: '63387157073',
    projectId: 'mental-health-care-d673d',
    storageBucket: 'mental-health-care-d673d.appspot.com',
    iosClientId: '63387157073-34e0vmvl7jur42h2c48ki4m50558d4r6.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentalHealthMobileApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_k2P_aHVW5lvPVFPWqtFeLQSQKtMmyzU',
    appId: '1:63387157073:ios:d37b1a7162246d39922e70',
    messagingSenderId: '63387157073',
    projectId: 'mental-health-care-d673d',
    storageBucket: 'mental-health-care-d673d.appspot.com',
    iosClientId: '63387157073-34e0vmvl7jur42h2c48ki4m50558d4r6.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentalHealthMobileApplication',
  );
}
