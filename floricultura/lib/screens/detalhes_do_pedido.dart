import 'package:floricultura/widgets/imagem_header.dart';
import 'package:floricultura/widgets/preco_item.dart';
import 'package:flutter/material.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/widget_texto.dart';

class DetalhesPedido extends StatelessWidget {
  const DetalhesPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ImagemHeader(imagem: 'images/orquidia.jpg'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB3B3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          WidgetTexto(
                            text: 'Status do Pedido',
                            tamanho: 20,
                            alignment: Alignment.centerLeft,
                          ),
                          WidgetTexto(
                            text: 'Entregue',
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB3B3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          WidgetTexto(
                            text: 'Detalhes do Pedido:',
                            tamanho: 20,
                            alignment: Alignment.centerLeft,
                          ),
                          PrecoItem(texto: 'Planta 1', valor: 180.00),
                          PrecoItem(texto: 'Planta 2', valor: 120.00),
                          PrecoItem(texto: 'Desconto:', valor: 00.00),
                          PrecoItem(
                            texto: 'Total:',
                            valor: 300.00,
                            fontSize: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB3B3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        children: [
                          WidgetTexto(
                            text: 'Endereço de Entrega',
                            tamanho: 20,
                            alignment: Alignment.centerLeft,
                          ),
                          WidgetTexto(
                            text: 'IESB Sul',
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
