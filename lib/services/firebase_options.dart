// File: lib/services/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // 🔥 A versão WEB ainda NÃO está configurada no Firebase
      // Então deixamos um placeholder seguro:
      throw UnsupportedError(
        'Firebase Web não está configurado. Adicione um app Web no Firebase Console '
        'e depois gere um novo firebase_options.dart usando: flutterfire configure',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'Plataforma não suportada
