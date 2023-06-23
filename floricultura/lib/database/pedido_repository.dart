import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floricultura/models/pedido.dart';

class PedidoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placePedido(Pedido pedido, String userId) async {
    try {
      await _firestore.collection('pedidos').doc(userId).set({
        'itens': pedido.itens,
        'total': pedido.total,
      });
    } catch (e) {
      throw Exception('Ocorreu um erro na hora de fazer o pedido: $e');
    }
  }

  Future<void> deletePedido(String userId) async {
  try {
    await _firestore.collection('pedidos').doc(userId).delete();
  } catch (e) {
    throw Exception('Ocorreu um erro ao excluir o pedido: $e');
    }
  }

  Future<List<Pedido>> fetchPedido(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('pedidos').doc(userId).get();

    final data = snapshot.data();

    if (data == null) {
      return[];
    }

    final pedidoData = {
      'itens': List<String>.from(data['itens']),
      'total': data['total'],
    };

    final pedido = Pedido(
      itens: pedidoData['itens'],
      total: pedidoData['total'],
    );

    return [pedido];
  }
}
