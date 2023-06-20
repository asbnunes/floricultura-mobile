import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floricultura/models/pedido.dart';

class PedidoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placePedido(Pedido pedido) async {
    try {
      await _firestore.collection('pedidos').add({
        'itens': pedido.itens,
        'total': pedido.total,
      });
    } catch (e) {
      throw Exception('Error placing order: $e');
    }
  }

  Future<List<Pedido>> fetchPedido() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('pedidos').get();

    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      final data = doc.data();

      if (data == null) {
        throw Exception("Data is null");
      }

      return Pedido(
        itens: List<String>.from(data['itens']),
        total: data['total'],
      );
    }).toList();
  }
}
