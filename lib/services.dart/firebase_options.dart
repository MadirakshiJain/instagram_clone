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
    apiKey: 'AIzaSyDuWdkJEWuZch9BFw6cM9Ou_vJFUpsC3gQ',
    appId: '1:788793370469:web:c09eb140ca98fa43d8e38c',
    messagingSenderId: '788793370469',
    projectId: 'bright-e17e9',
    authDomain: 'bright-e17e9.firebaseapp.com',
    storageBucket: 'bright-e17e9.appspot.com',
    measurementId: 'G-7SF8YLYF26',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMTrbLPsfcYKBRTJMUdCHTTLp3VQOmn5k',
    appId: '1:788793370469:android:2707636bf3b79ce9d8e38c',
    messagingSenderId: '788793370469',
    projectId: 'bright-e17e9',
    storageBucket: 'bright-e17e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO45yP4fUowArorm_dP-mas1PdrvESRVs',
    appId: '1:788793370469:ios:94d9956417ce5f66d8e38c',
    messagingSenderId: '788793370469',
    projectId: 'bright-e17e9',
    storageBucket: 'bright-e17e9.appspot.com',
    iosClientId:
        '788793370469-djnb2iqgcvdh3i846a0fvbgdslg05290.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCO45yP4fUowArorm_dP-mas1PdrvESRVs',
    appId: '1:788793370469:ios:94d9956417ce5f66d8e38c',
    messagingSenderId: '788793370469',
    projectId: 'bright-e17e9',
    storageBucket: 'bright-e17e9.appspot.com',
    iosClientId:
        '788793370469-djnb2iqgcvdh3i846a0fvbgdslg05290.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}