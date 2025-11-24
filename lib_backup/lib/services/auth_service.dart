import 'package:flutter/material.dart';

class AuthService {
  // Temporário: autenticação simulada
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == "teste@teste.com" && password == "123456") {
      return true;
    }

    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return true; // sempre sim, até integrar o Firebase
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
