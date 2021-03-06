// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQr08fqo7ClZex1JHC0h3woY1pDsAvAtY',
    appId: '1:857958773511:web:1a783b50be5f73698b8ba2',
    messagingSenderId: '857958773511',
    projectId: 'flutter-architecture-11ca3',
    authDomain: 'flutter-architecture-11ca3.firebaseapp.com',
    storageBucket: 'flutter-architecture-11ca3.appspot.com',
    measurementId: 'G-2EMK9QSP5Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYDTRCnOD9nXWbjiwv86wIoMj-VELLuBU',
    appId: '1:857958773511:android:914ccbfb8bfa53278b8ba2',
    messagingSenderId: '857958773511',
    projectId: 'flutter-architecture-11ca3',
    storageBucket: 'flutter-architecture-11ca3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKLnnAbYou7besNm78QbUPKB8ZtBuSIlo',
    appId: '1:857958773511:ios:1475a87d112bd5ed8b8ba2',
    messagingSenderId: '857958773511',
    projectId: 'flutter-architecture-11ca3',
    storageBucket: 'flutter-architecture-11ca3.appspot.com',
    iosClientId: '857958773511-c78lvg536uacmqerq11g46i25p3virr1.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTodo',
  );
}
