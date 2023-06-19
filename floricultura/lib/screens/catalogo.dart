import 'package:flutter/material.dart';
import 'package:floricultura/widgets/produto.dart';
import 'package:floricultura/widgets/botao_retornar.dart';

import '../widgets/widget_texto.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Retornar(),
            const SizedBox(height: 0.5),
            const WidgetTexto(
              text: 'Orquídeas',
              tamanho: 30,
              alignment: Alignment.center,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
                padding: const EdgeInsets.all(8.0),
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
                    name: "Orquídea de duas hastes amarela...",
                    price: "R\$ 80,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes roxa...",
                    price: "R\$ 45,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes branca...",
                    price: "R\$ 70,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea de duas hastes pintada...",
                    price: "R\$ 90,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea 7",
                    price: "R\$ 60,00",
                    image: "images/orquidia.jpg",
                  ),
                  ProductWidget(
                    name: "Orquídea 8",
                    price: "R\$ 75,00",
                    image: "images/orquidia.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
