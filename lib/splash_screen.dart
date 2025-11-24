import 'package:flutter/material.dart';
import '../navigation/app_navigation.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<TelaInicial> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      AppNavigation.irParaLogin(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Image.asset(
            'ativose/imagense/logo_voxfuture_splash.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
