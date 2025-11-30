import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/app_theme.dart';
import 'config/routes.dart';
import 'screens/auth_wrapper.dart';
import 'services/auth_service.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart'; // será gerado após você enviar o JSON

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VoxFuture',
        theme: AppTheme.darkTheme,
        routes: AppRoutes.routes,
        home: const AuthWrapper(),
      ),
    );
  }
}
