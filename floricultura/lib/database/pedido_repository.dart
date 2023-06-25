import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floricultura/models/pedido.dart';

class PedidoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placePedido(Pedido pedido, String userId) async {
    try {
      await _firestore.collection('pedidos').add({
        'userId' : userId,
        'itens': pedido.itens,
        'total': pedido.total,
      });
    } catch (e) {
      throw Exception('Ocorreu um erro na hora de fazer o pedido: $e');
    }
  }

  Future<void> deletePedido(String pedidoId) async {
  try {
    await _firestore.collection('pedidos').doc(pedidoId).delete();
  } catch (e) {
    throw Exception('Ocorreu um erro ao excluir o pedido: $e');
    }
  }

  Future<List<Pedido>> fetchPedido(String userId) async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('pedidos')
        .where('userId', isEqualTo: userId)
        .get();

    final List<Pedido> pedidos = [];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final pedidoData = {
        'id': doc.id,
        'userId': data['userId'],
        'itens': List<String>.from(data['itens']),
        'total': data['total'],
      };

      final pedido = Pedido(
        id: pedidoData['id'],
        userId: pedidoData['userId'],
        itens: pedidoData['itens'],
        total: pedidoData['total'],
      );

      pedidos.add(pedido);
    }

    return pedidos;
  } catch (e) {
    throw Exception('Ocorreu um erro ao buscar os pedidos: $e');
  }
}

}
