import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/produto.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';

class PreviewItens extends StatelessWidget {
  final String text;
  //final String image;

  const PreviewItens({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WidgetTexto(
          text: text,
          tamanho: 24,
          alignment: Alignment.centerLeft,
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
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
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          child: const FractionallySizedBox(
            widthFactor: 0.3,
            child: Botao(
              text: 'Ver Mais',
              screenName: 'catalogo',
            ),
          ),
        ),
      ],
    );
  }
}
