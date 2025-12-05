import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userChanges => _auth.authStateChanges();

  // LOGIN
  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "ok";
    } on FirebaseAuthException catch (e) {
      return _firebaseError(e.code);
    } catch (e) {
      return "Erro inesperado: $e";
    }
  }

  // REGISTRAR
  Future<String> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "ok";
    } on FirebaseAuthException catch (e) {
      return _firebaseError(e.code);
    } catch (e) {
      return "Erro inesperado: $e";
    }
  }

  // ESQUECI A SENHA
  Future<String> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "ok";
    } on FirebaseAuthException catch (e) {
      return _firebaseError(e.code);
    } catch (e) {
      return "Erro inesperado: $e";
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // MAPEAMENTO DE ERROS
  String _firebaseError(String code) {
    switch (code) {
      case 'invalid-email':
        return "Email inválido.";
      case 'user-not-found':
        return "Usuário não encontrado.";
      case 'wrong-password':
        return "Senha incorreta.";
      case 'email-already-in-use':
        return "Este email já está em uso.";
      case 'weak-password':
        return "A senha é muito fraca.";
      default:
        return "Erro: $code";
    }
  }
}
