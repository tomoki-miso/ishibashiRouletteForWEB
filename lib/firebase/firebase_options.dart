// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyD3zo_6slFMovd5TW8-AIF06XgxI-gXGNo',
    appId: '1:766148127415:web:ad3f1a33a4f111a6eabb32',
    messagingSenderId: '766148127415',
    projectId: 'test-nomura-d6ec4',
    authDomain: 'test-nomura-d6ec4.firebaseapp.com',
    storageBucket: 'test-nomura-d6ec4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAR2xf9TJ4x17w3Mj-9Xqn9nvEJD6iEZA4',
    appId: '1:766148127415:android:924e6377604ab6cfeabb32',
    messagingSenderId: '766148127415',
    projectId: 'test-nomura-d6ec4',
    storageBucket: 'test-nomura-d6ec4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzDfIO8WcAMJI9EQkLtMGWokxh5y3d-ek',
    appId: '1:766148127415:ios:321bf5e8b02ba2f0eabb32',
    messagingSenderId: '766148127415',
    projectId: 'test-nomura-d6ec4',
    storageBucket: 'test-nomura-d6ec4.appspot.com',
    iosClientId: '766148127415-2agsu8gjbpecj6u3ee3cfuvkkbutmpp3.apps.googleusercontent.com',
    iosBundleId: 'com.example.ishibashi',
  );


  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzDfIO8WcAMJI9EQkLtMGWokxh5y3d-ek',
    appId: '1:766148127415:ios:321bf5e8b02ba2f0eabb32',
    messagingSenderId: '766148127415',
    projectId: 'test-nomura-d6ec4',
    storageBucket: 'test-nomura-d6ec4.appspot.com',
    iosClientId: '766148127415-2agsu8gjbpecj6u3ee3cfuvkkbutmpp3.apps.googleusercontent.com',
    iosBundleId: 'com.example.ishibashi',
  );

}
