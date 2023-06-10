import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/campo_texto.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/preco_item.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import '../widgets/carrinho_item.dart';
import '../widgets/navigation_bar.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
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
          child: Column(
            children: [
              const Icone(iconData: Icons.shopping_cart),
              const WidgetTexto(
                text: 'Carrinho',
                tamanho: 30,
                alignment: Alignment.center,
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
                child: const Row(
                  children: <Widget>[
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
              const LinhaDivisora(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: PrecoItem(
                  texto: 'Subtotal:',
                  valor: 360.00,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: PrecoItem(
                  texto: 'Desconto:',
                  valor: 10.00,
                ),
              ),
              const SizedBox(height: 20),
              const LinhaDivisora(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: PrecoItem(
                  texto: 'Total:',
                  valor: 350.00,
                  fontSize: 25,
                ),
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
                  screenName: 'pagamento',
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
