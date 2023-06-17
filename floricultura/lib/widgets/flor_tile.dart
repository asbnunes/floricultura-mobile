import 'package:floricultura/screens/pagina_do_produto.dart';
import 'package:flutter/material.dart';

import '../models/flor.dart';
import '../utils/formatador_texto.dart';

class FlorTile extends StatelessWidget {
  final Flor flor;
  final Widget icon;
  final bool displayCor;
  const FlorTile({super.key, required this.flor, required this.icon, this.displayCor = false});

  @override
  Widget build(BuildContext context) {

    String titleTexto = displayCor ? '${flor.nome} ${flor.corEscolhida}' : flor.nome;

    String precoFormatado = FormatadorPreco.formatPrice(flor.preco);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size.fromHeight(125),
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: const Color(0xffffb3b3),
        ),
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaDoProduto(flor: flor),
                ),
              );
        },
        child: ListTile(
          title: Text(titleTexto),
          subtitle: Text(precoFormatado),
          leading: Image.asset(flor.imagem),
          trailing: icon,
        ),
      ),
    );
  }
}
