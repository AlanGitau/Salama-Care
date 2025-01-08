// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD21eZhCKZBIygDQTX970lIRdawHh-Lgrc',
    appId: '1:279271336949:web:ae051e79236e398b118ebc',
    messagingSenderId: '279271336949',
    projectId: 'salama-care-3c714',
    authDomain: 'salama-care-3c714.firebaseapp.com',
    storageBucket: 'salama-care-3c714.firebasestorage.app',
    measurementId: 'G-ZPQMLHT4W1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9k5XzVXL1eZ9yDJcggiNtPPZU0kM-F9w',
    appId: '1:279271336949:android:238823b8dd0f5489118ebc',
    messagingSenderId: '279271336949',
    projectId: 'salama-care-3c714',
    storageBucket: 'salama-care-3c714.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzKIohV_5thwCwupuMA_lc72rEx3e_qBA',
    appId: '1:279271336949:ios:496d750bdec4941b118ebc',
    messagingSenderId: '279271336949',
    projectId: 'salama-care-3c714',
    storageBucket: 'salama-care-3c714.firebasestorage.app',
    iosBundleId: 'com.example.signup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzKIohV_5thwCwupuMA_lc72rEx3e_qBA',
    appId: '1:279271336949:ios:496d750bdec4941b118ebc',
    messagingSenderId: '279271336949',
    projectId: 'salama-care-3c714',
    storageBucket: 'salama-care-3c714.firebasestorage.app',
    iosBundleId: 'com.example.signup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD21eZhCKZBIygDQTX970lIRdawHh-Lgrc',
    appId: '1:279271336949:web:8643df68e11802e4118ebc',
    messagingSenderId: '279271336949',
    projectId: 'salama-care-3c714',
    authDomain: 'salama-care-3c714.firebaseapp.com',
    storageBucket: 'salama-care-3c714.firebasestorage.app',
    measurementId: 'G-LCCGFRJFGV',
  );
}
