import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floricultura/models/usuario.dart';
import 'package:floricultura/services/auth_exceptions.dart';
import 'package:floricultura/utils/codificador_senha.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Usuario? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null)
          ? null
          : Usuario(id: user.uid, email: user.email!, senha: '');
      isLoading = false;
      notifyListeners();
    });
  }

  getUser() {
    usuario = _auth.currentUser != null
        ? Usuario(
            id: _auth.currentUser!.uid,
            email: _auth.currentUser!.email!,
            senha: '')
        : null;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: senha);
      await _createUserInFirestore(userCredential.user!, senha);
      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha precisa ter pelo menos 6 caracteres.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado.');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta.');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    getUser();
  }

  redefinir(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      }
    }
  }

  _createUserInFirestore(User user, String senha) async {
    final firestore = FirebaseFirestore.instance;
    final userData = {
      'email': user.email,
      'senha': CodificadorSenha.codificar(senha),
    };
    await firestore.collection('usuarios').doc(user.uid).set(userData);
  }
}
