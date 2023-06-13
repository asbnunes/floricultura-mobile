import 'package:floricultura/screens/pagina_do_produto.dart';
import 'package:flutter/material.dart';

import '../models/flor.dart';

class FlorTile extends StatelessWidget {
  final Flor flor;
  const FlorTile({super.key, required this.flor});

  @override
  Widget build(BuildContext context) {
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
          title: Text(flor.nome),
          subtitle: Text(flor.preco),
          leading: Image.asset(flor.imagem),
          trailing: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
