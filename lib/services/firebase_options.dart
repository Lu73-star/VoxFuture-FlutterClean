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
          'Configuração iOS não encontrada. Registre um app iOS no Firebase e atualize este arquivo.',
        );

      default:
        throw UnsupportedError(
          'Plataforma não suportada pelo Firebase.',
        );
    }
  }

  // 🔥 CONFIGURAÇÃO WEB — ATUALIZADA E
