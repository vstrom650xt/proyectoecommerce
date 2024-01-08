import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChange => _auth.authStateChanges();

  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Devuelve el usuario autenticado desde UserCredential
      return userCredential.user;
    } catch (e) {
      // Manejo de errores, puedes imprimir el error si es necesario
      print('Error al iniciar sesión: $e');
      return null; // Retorna null en caso de error
    }
  }

  static Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //   Future<void> createUserWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
