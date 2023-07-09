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
                icon: const Icon(Icons.delete),
                color: const Color(0xff6c4848),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content:
                          const Text('Tem certeza que quer remover o pedido do histórico?'),
                      actions: [
                        TextButton(
                          child: const Text('Não'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('Sim'),
                          onPressed: () {
                            onDelete();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
