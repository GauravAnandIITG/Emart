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
    apiKey: 'AIzaSyC3u9DqHxVjGuY0xqLRDc46eUrguCCBqW4',
    appId: '1:989295205458:web:2871c04b230de9ea3e138b',
    messagingSenderId: '989295205458',
    projectId: 'ecommerce-bd835',
    authDomain: 'ecommerce-bd835.firebaseapp.com',
    storageBucket: 'ecommerce-bd835.appspot.com',
    measurementId: 'G-25G9HQWF3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1r2lP1LgS6c2uGoabTI1yu2SNCm2zKlk',
    appId: '1:989295205458:android:02e510712ca2bc763e138b',
    messagingSenderId: '989295205458',
    projectId: 'ecommerce-bd835',
    storageBucket: 'ecommerce-bd835.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRi3GgdQQWMe6zHUad_e0e5uJrQ2d4iMk',
    appId: '1:989295205458:ios:caca476ce61452513e138b',
    messagingSenderId: '989295205458',
    projectId: 'ecommerce-bd835',
    storageBucket: 'ecommerce-bd835.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRi3GgdQQWMe6zHUad_e0e5uJrQ2d4iMk',
    appId: '1:989295205458:ios:caca476ce61452513e138b',
    messagingSenderId: '989295205458',
    projectId: 'ecommerce-bd835',
    storageBucket: 'ecommerce-bd835.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3u9DqHxVjGuY0xqLRDc46eUrguCCBqW4',
    appId: '1:989295205458:web:4cff57f65f733fd33e138b',
    messagingSenderId: '989295205458',
    projectId: 'ecommerce-bd835',
    authDomain: 'ecommerce-bd835.firebaseapp.com',
    storageBucket: 'ecommerce-bd835.appspot.com',
    measurementId: 'G-PSRY9B7WT7',
  );
}
