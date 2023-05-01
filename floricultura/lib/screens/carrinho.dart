import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/campo_texto.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/preco_item.dart';
import 'package:flutter/material.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import '../widgets/carrinho_item.dart';

class Carrinho extends StatelessWidget {
  const Carrinho({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            const Icone(iconData: Icons.shopping_cart),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Carrinho",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const CarrinhoItem(
                nome: 'Item 1', imagem: 'images/orquidia.jpg', preco: 180.00),
            const SizedBox(height: 10),
            const CarrinhoItem(
                nome: 'Item 2', imagem: 'images/orquidia.jpg', preco: 180.00),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                children: const <Widget>[
                  Flexible(
                    child: CampoTexto(
                      nome: 'Cupom de Desconto',
                      isEditable: true,
                    ),
                  ),
                  Flexible(
                    child: Botao(
                      text: 'Adicionar Cupom',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: Colors.black,
              child: const SizedBox.expand(),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: PrecoItem(texto: 'Subtotal:', valor: 360.00,),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: PrecoItem(texto: 'Desconto:', valor: 10.00,),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: Colors.black,
              child: const SizedBox.expand(),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: PrecoItem(texto: 'Total:', valor: 350.00, fontSize: 25,),
            ),
            const SizedBox(height: 20),
            Container(
              height: 45,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Botao(
                text: 'Comprar',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
