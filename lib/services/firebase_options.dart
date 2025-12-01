// lib/services/firebase_options.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'FirebaseOptions não configurado para Web. Configure antes de usar.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions não configurado para esta plataforma.',
        );
    }
  }

  /// App Android com package **com.voxfuture.app**
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-2VvvLbrYF0xvm237XqV7uZttsQMlj9c',
    appId: '1:957218435739:android:32b32593bed74aaacdcc3e',
    messagingSenderId: '957218435739',
    projectId: 'voxfuture-12d52',
    storageBucket: 'voxfuture-12d52.firebasestorage.app',
  );
}
