import 'package:floricultura/models/pedido.dart';
import 'package:floricultura/utils/formatador_texto.dart';
import 'package:flutter/material.dart';




class PedidoTile extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback onDelete;

  const PedidoTile({Key? key, required this.pedido, required this.onDelete})
      : super(key: key);

  void _deletePedido() {
    onDelete();
  }

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
        child: Stack(
          children: [
            Column(
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
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: _deletePedido,
                icon: const Icon(
                  Icons.clear,
                  color: Color.fromARGB(220, 68, 68, 68),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
