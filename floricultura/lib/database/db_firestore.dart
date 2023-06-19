import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/flor.dart';

class DBFirestore {
  DBFirestore._();
  static final DBFirestore _instance = DBFirestore._();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory DBFirestore() => _instance;

  Future<List<Flor>> fetchFlores() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('flores').get();

    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      final data = doc.data();

      if (data == null) {
        throw Exception("Data is null");
      }

      return Flor(
        nome: data['nome'],
        preco: data['preco'],
        imagem: data['imagem'],
        opcoesDeCores: List<String>.from(data['opcoesDeCores']),
        corEscolhida: data['corEscolhida'] ?? '',
      );
    }).toList();
  }
}
