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
            throw UnsupportedError(
                'DefaultFirebaseOptions have not been configured for web - '
                'you can reconfigure this by running the FlutterFire CLI again.',
            );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAojpytX7GxAQg7lASD-VsMFRYrEUoVlSQ',
    appId: '1:633364774729:android:40e4e46158dc16ceee6498',
    messagingSenderId: '633364774729',
    projectId: 'der-brief',
    storageBucket: 'der-brief.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkKobOrRWkEUMUF_EgDrrRFVgtSoanGW4',
    appId: '1:633364774729:ios:af074972a5e21bbcee6498',
    messagingSenderId: '633364774729',
    projectId: 'der-brief',
    storageBucket: 'der-brief.appspot.com',
    androidClientId: '633364774729-me5hhjqj7js50d621hkn2l142q2mqtp6.apps.googleusercontent.com',
    iosClientId: '633364774729-ief3dt700l26lndesequnh0l3fo5nvg1.apps.googleusercontent.com',
    iosBundleId: 'com.example.derBrief',
  );

}