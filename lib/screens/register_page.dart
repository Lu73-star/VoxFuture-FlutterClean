import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Criar Conta",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: email,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              TextField(
                controller: password,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              if (errorMessage != null)
                Text(errorMessage!,
                    style: const TextStyle(color: Colors.red)),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () async {
                  String? result = await AuthService()
                      .register(email.text, password.text);

                  if (result != null) {
                    setState(() => errorMessage = result);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
