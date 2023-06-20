import 'package:floricultura/models/pedido.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import 'package:floricultura/widgets/pedido_tile.dart';
import 'package:flutter/material.dart';

import '../database/pedido_repository.dart';
import '../widgets/icone.dart';
import '../widgets/widget_texto.dart';

class PedidosPagina extends StatefulWidget {
  const PedidosPagina({super.key});

  @override
  State<PedidosPagina> createState() => _PedidosPaginaState();
}

class _PedidosPaginaState extends State<PedidosPagina> {
  late Future<List<Pedido>> _pedidos;
  final PedidoRepository _pedidoRepository = PedidoRepository();

  @override
  void initState() {
    super.initState();
    _pedidos = _pedidoRepository.fetchPedido();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Retornar(),
              const Icone(iconData: Icons.receipt_long),
              const WidgetTexto(
                text: 'Meus Pedidos',
                tamanho: 30,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<List<Pedido>>(
                  future: _pedidos,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final pedidos = snapshot.data![index];
                          return PedidoTile(pedido: pedidos);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
