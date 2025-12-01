// File: firebase_options.dart
// AUTO-GERADO — VOICE FUTURE (VOXFUTURE)

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class FirebaseOptionsVoxFuture {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Web não configurado. Configure um app Web no Firebase.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      case TargetPlatform.iOS:
        return ios;

      case TargetPlatform.macOS:
        return macos;

      default:
        throw UnsupportedError(
          'Plataforma não suportada pelo Firebase.',
        );
    }
  }

  // -----------------------------
  // ANDROID
  // -----------------------------
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AQUI_API_KEY_ANDROID',
    appId: 'AQUI_APP_ID_ANDROID',
    messagingSenderId: 'AQUI_MESSAGING_SENDER_ID',
    projectId: 'AQUI_PROJECT_ID',
    storageBucket: 'AQUI_STORAGE_BUCKET',
  );

  // -----------------------------
  // iOS
  // -----------------------------
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AQUI_API_KEY_IOS',
    appId: 'AQUI_APP_ID_IOS',
    messagingSenderId: 'AQUI_MESSAGING_SENDER_ID',
    projectId: 'AQUI_PROJECT_ID',
    storageBucket: 'AQUI_STORAGE_BUCKET',
    iosBundleId: 'com.voxfuture.app',
    androidClientId: 'AQUI_ANDROID_CLIENT_ID',
    iosClientId: 'AQUI_IOS_CLIENT_ID',
  );

  // -----------------------------
  // macOS (opcional)
  // -----------------------------
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AQUI_API_KEY_IOS',
    appId: 'AQUI_APP_ID_IOS',
    messagingSenderId: 'AQUI_MESSAGING_SENDER_ID',
    projectId: 'AQUI_PROJECT_ID',
    storageBucket: 'AQUI_STORAGE_BUCKET',
    iosBundleId: 'com.voxfuture.app',
  );
}
