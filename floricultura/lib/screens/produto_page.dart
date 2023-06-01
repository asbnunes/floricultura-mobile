import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/imagem_header.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/produto.dart';

class ProdutoPage extends StatelessWidget {
  const ProdutoPage({Key? key}) : super(key: key);

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
              const ImagemHeader(imagem: "images/orquidia.jpg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const WidgetTexto(
                      text: 'R\$180,00',
                      tamanho: 30,
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 10),
                    const WidgetTexto(
                      text: 'Orquídia Branca',
                      tamanho: 20,
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 5),
                    const WidgetTexto(
                      text:
                          'Descrição do Produto vem aqui, pelo menos umas duas a quatro linhas de informação sobre o produto que no caso é a orquídia branca de duas hastes botão logo abaixo.',
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Botao(
                        text: 'Adicionar ao carrinho',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const WidgetTexto(
                      text: 'Você também pode gostar:',
                      tamanho: 25,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
                padding: const EdgeInsets.all(8),
                children: const [
                  ProductWidget(
                    name: "Orquídea de duas hastes rosa...",
                    price: "R\$ 50,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes azul...",
                    price: "R\$ 65,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes rosa...",
                    price: "R\$ 50,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes azul...",
                    price: "R\$ 65,00",
                    image: "images/orquidia.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
