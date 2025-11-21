import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';
import '../services/auth_service.dart';
import '../utils/validators.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    final auth = AuthService();
    final success = await auth.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    setState(() => loading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Credenciais inválidas.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1A),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "VoxFuture",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                InputField(
                  label: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),

                InputField(
                  label: "Senha",
                  controller: passwordController,
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),

                const SizedBox(height: 16),

                PrimaryButton(
                  text: "Entrar",
                  loading: loading,
                  onPressed: _login,
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Criar nova conta",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
