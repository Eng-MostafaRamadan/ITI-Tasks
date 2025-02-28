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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDerVhpvJ_CkUpH9_rnOPSfwv1wMGOkuPI',
    appId: '1:25200306966:web:5d94e8f267607175253e37',
    messagingSenderId: '25200306966',
    projectId: 'eventapp-8b6f3',
    authDomain: 'eventapp-8b6f3.firebaseapp.com',
    storageBucket: 'eventapp-8b6f3.firebasestorage.app',
    measurementId: 'G-JPNVFMVK81',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBB58iNGO7oi3QkgkyEae-ZLm2mzTd2CU8',
    appId: '1:25200306966:android:6c8696444df8d837253e37',
    messagingSenderId: '25200306966',
    projectId: 'eventapp-8b6f3',
    storageBucket: 'eventapp-8b6f3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjd_afmLCIr5JmVX5hdAYjq_i82fSZzNk',
    appId: '1:25200306966:ios:b6a43abdfeeae459253e37',
    messagingSenderId: '25200306966',
    projectId: 'eventapp-8b6f3',
    storageBucket: 'eventapp-8b6f3.firebasestorage.app',
    iosBundleId: 'com.example.day7Task',
  );
}
