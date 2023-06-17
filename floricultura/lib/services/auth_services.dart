import 'package:firebase_auth/firebase_auth.dart';
import 'package:floricultura/services/auth_exceptions.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }
  
  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        throw AuthException('A senha precisa ter pelo menos 6 caracteres.');
      } else if(e.code == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado.');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        throw AuthException('Email não encontrado.');
      } else if(e.code == 'wrong-password'){
        throw AuthException('Senha incorreta.');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }  

}