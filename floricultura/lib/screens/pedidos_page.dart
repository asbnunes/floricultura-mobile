import 'package:floricultura/models/pedido.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import 'package:floricultura/widgets/pedido_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/pedido_repository.dart';
import '../services/auth_services.dart';
import '../widgets/icone.dart';
import '../widgets/widget_texto.dart';

class PedidosPagina extends StatefulWidget {
  const PedidosPagina({Key? key}) : super(key: key);

  @override
  State<PedidosPagina> createState() => _PedidosPaginaState();
}

class _PedidosPaginaState extends State<PedidosPagina> {
  late Future<List<Pedido>> _pedidos;
  final PedidoRepository _pedidoRepository = PedidoRepository();
  late String _userId;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUser();
    });
  }

  Future<void> _delete(String pedidoId) async {
    try {
      await _pedidoRepository.deletePedido(pedidoId);
      setState(() {
        _pedidos = _pedidoRepository.fetchPedido(_userId);
      });
    } catch (e) {
      throw Exception('Ocorreu um erro ao excluir o pedido: $e');
    }
  }


  void _getUser() async {
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    await authService.getUser();
    final userId = authService.usuario?.uid ?? '';
    setState(() {
      _userId = userId;
      _pedidos = _pedidoRepository.fetchPedido(_userId);
      _isInitialized = true;
    });
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
                child: _isInitialized
                    ? FutureBuilder<List<Pedido>>(
                        future: _pedidos,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final pedido = snapshot.data![index];
                                return PedidoTile(
                                  pedido: pedido,
                                  onDelete: () {
                                    _delete(pedido.id);
                                  },
                                );
                              },
                            );
                          }
                        },
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
