// File generated for HMC Firebase project (hmc-mobiles).
// Manual version — values from google-services.json and GoogleService-Info.plist.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
    apiKey: 'AIzaSyAwLf-JX0_oiJYAVkmDOedetFJd1h9Fs0s',
    appId: '1:12325665330:android:c73dc7647b9fdf0a939a2b',
    messagingSenderId: '12325665330',
    projectId: 'hmc-mobiles',
    storageBucket: 'hmc-mobiles.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpIR6kja98zpNJL-HdnqbmqeEG6TUoSCM',
    appId: '1:12325665330:ios:59659f3c5ea3de37939a2b',
    messagingSenderId: '12325665330',
    projectId: 'hmc-mobiles',
    storageBucket: 'hmc-mobiles.firebasestorage.app',
    iosBundleId: 'com.hasanmobilecenter.shewaadda',
  );
}
