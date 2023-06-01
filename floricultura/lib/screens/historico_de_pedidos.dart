import 'package:floricultura/widgets/botao_retornar.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/pedido_anterior.dart';
import 'package:flutter/material.dart';

import '../widgets/icone.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/widget_texto.dart';

class HistoricoPedidos extends StatelessWidget {
  const HistoricoPedidos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: const [
              Icone(iconData: Icons.receipt_long),
              Retornar(),
              WidgetTexto(
                text: 'Meus Pedidos',
                tamanho: 30,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 10,
              ),
              LinhaDivisora(),
              PedidoAnterior(
                nomePedido: 'Pedido #1234',
                dataPedido: 'Pedido feito em: DD/MM/AAAA',
                statusPedido: 'Status: Entregue',
                alignment: Alignment.center,
                fontWeight: FontWeight.w400,
                imagem: 'images/orquidia.jpg',
              ),
              PedidoAnterior(
                nomePedido: 'Pedido #0102',
                dataPedido: 'Pedido feito em: 04/12/2002',
                statusPedido: 'Status: Perdido',
                alignment: Alignment.center,
                fontWeight: FontWeight.w400,
                imagem: 'images/orquidia.jpg',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
