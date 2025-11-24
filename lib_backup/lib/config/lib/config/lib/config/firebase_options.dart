import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'SUA_API_KEY_AQUI',
      appId: 'SEU_APP_ID_AQUI',
      messagingSenderId: 'SEU_SENDER_ID_AQUI',
      projectId: 'SEU_PROJECT_ID_AQUI',
    );
  }
}
