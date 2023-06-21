import 'package:crypto/crypto.dart';
import 'dart:convert';

class CodificadorSenha {
  static String codificar(String password) {
    final bytes = utf8.encode(password); 
    final hash = sha256.convert(bytes); 
    return hash.toString(); 
  }
}