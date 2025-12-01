import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/routes.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoxFuture',
      initialRoute: '/', // Login é a tela inicial
      routes: AppRoutes.routes,
      theme: ThemeData.dark(), // mantém o tema azul/dourado depois se quiser
    );
  }
}
