// File: lib/services/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'A configuração Web ainda não foi adicionada. '
        'Registre o app Web no Firebase e envie a config.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'Configuração iOS não encontrada. Adicione para ativar no iPhone.',
        );
      default:
        throw UnsupportedError(
          'Plataforma não suportada para Firebase.');
    }
  }

  // ANDROID
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyA-2VvvLbrYF0xvm237XqV7uZttsQMlj9c",
    appId: "1:957218435739:android:fdb486ad33baa37bcdcc3e",
    messagingSenderId: "957218435739",
    projectId: "voxfuture-12d52",
    storageBucket: "voxfuture-12d52.firebasestorage.app",
  );
}
