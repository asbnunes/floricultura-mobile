import 'package:floricultura/models/pedido.dart';
import 'package:floricultura/utils/formatador_texto.dart';
import 'package:flutter/material.dart';

class PedidoTile extends StatelessWidget {
  final Pedido pedido;

  const PedidoTile({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    String totalFormatado = FormatadorPreco.formatPrice(pedido.total);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffb3b3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ...pedido.itens.map((item) => ListTile(
              title: Text(item),
            )),
            ListTile(
              title: const Text('Total'),
              subtitle: Text(totalFormatado),
            ),
          ],
        ),
      ),
    );
  }
}
