// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'O FirebaseOptions para Web não está configurado.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'FirebaseOptions para iOS ainda não configurado.',
        );
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Este projeto usa apenas Android no momento.',
        );
      default:
        throw UnsupportedError(
          'Plataforma desconhecida.',
        );
    }
  }

  // ANDROID
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-2VvvLbrYF0xvm237XqV7uZttsQMlj9c',
    appId: '1:957218435739:android:32b32593bed74aaacdcc3e',
    messagingSenderId: '957218435739',
    projectId: 'voxfuture-12d52',
    storageBucket: 'voxfuture-12d52.firebasestorage.app',
  );
}
