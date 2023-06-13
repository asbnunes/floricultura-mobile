import 'package:floricultura/models/flor.dart';
import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/imagem_header.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/produto.dart';

class PaginaDoProduto extends StatelessWidget {
  final Flor flor;

  const PaginaDoProduto({Key? key, required this.flor}) : super(key: key);

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
          child: ListView(
            children: <Widget>[
              ImagemHeader(imagem: flor.imagem),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    WidgetTexto(
                      text: flor.preco,
                      tamanho: 30,
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 10),
                    WidgetTexto(
                      text: flor.nome,
                      tamanho: 25,
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 30),
                    const WidgetTexto(
                      text: 'Escolha a cor:',
                      tamanho: 15,
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Botao(
                        text: 'Adicionar ao carrinho',
                        screenName: 'carrinho',
                      ),
                    ),
                    const SizedBox(height: 20),
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
