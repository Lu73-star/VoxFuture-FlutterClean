// File: lib/services/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      case TargetPlatform.iOS:
        throw UnsupportedError(
          'Configuração iOS não encontrada.',
        );

      default:
        throw UnsupportedError(
          'Plataforma não suportada pelo Firebase.',
        );
    }
  }

  // ------------------------------------------------------------
  // ANDROID
  // ------------------------------------------------------------
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyA-2VvvLbrYF0xvm237XqV7uZttsQMlj9c",
    appId: "1:957218435739:android:fdb486ad33baa37bcdcc3e",
    messagingSenderId: "957218435739",
    projectId: "voxfuture-12d52",
    storageBucket: "voxfuture-12d52.firebasestorage.app",
  );

  // ------------------------------------------------------------
  // WEB
  // ------------------------------------------------------------
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDUDiuIYmPCf4_KjKqkgZz43ym5oVio-EA",
    authDomain: "voxfuture-12d52.firebaseapp.com",
    projectId: "voxfuture-12d52",
    storageBucket: "voxfuture-12d52.firebasestorage.app",
    messagingSenderId: "957218435739",
    appId: "1:957218435739:web:0dba10898b7cbb61cdcc3e",
    measurementId: "G-BBPEBEZY6H",
  );
}
