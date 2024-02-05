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
    apiKey: 'AIzaSyAlQn4v7b-H_BDVFtgKeUJyP5KRJVEuvr0',
    appId: '1:274906387857:web:1d1813f3a7af02f3a6b630',
    messagingSenderId: '274906387857',
    projectId: 'amazonmusic',
    authDomain: 'music-19d73.firebaseapp.com',
    storageBucket: 'amazonmusic.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQX6ciXuMwLyefKdd9DtMWDbVZbcb8P6o',
    appId: '1:274906387857:android:f9560805a258df70a6b630',
    messagingSenderId: '274906387857',
    projectId: 'amazonmusic',
    storageBucket: 'amazonmusic.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVaI0qAYZA1uZj-1xaD9acvsbnrfF37qs',
    appId: '1:274906387857:ios:8e87167cb66716f0a6b630',
    messagingSenderId: '274906387857',
    projectId: 'amazonmusic',
    storageBucket: 'amazonmusic.appspot.com',
    iosClientId: '274906387857-68ppo7kjah0qqt585u6m10nf32olnsm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.amazonmusiclone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVaI0qAYZA1uZj-1xaD9acvsbnrfF37qs',
    appId: '1:274906387857:ios:8e87167cb66716f0a6b630',
    messagingSenderId: '274906387857',
    projectId: 'amazonmusic',
    storageBucket: 'amazonmusic.appspot.com',
    iosClientId: '274906387857-68ppo7kjah0qqt585u6m10nf32olnsm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.amazonmusiclone',
  );
}