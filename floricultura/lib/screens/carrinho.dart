import 'package:floricultura/models/loja_flores.dart';
import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/flor_tile.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/preco_item.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/flor.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {

  void removerCarrinho(Flor flor){
    Provider.of<LojaFlores>(context, listen: false).removerDoCarrinho(flor);
  }

  @override
  Widget build(BuildContext context) {

    var carrinho = Provider.of<LojaFlores>(context).carrinho;
    double total = 0;

    for (var flor in carrinho) {
      total += flor.preco;
    }

    return Consumer<LojaFlores>(
      builder: (context, value, child) => Scaffold(
        body: Container(
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
              Expanded(
                child: ListView.builder(
                  itemCount: value.carrinho.length,
                  itemBuilder: (context, index) {
                    Flor flores = value.carrinho[index];
                    return FlorTile(
                        flor: flores,
                        displayCor: true,
                        icon: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => removerCarrinho(flores),
                        ),);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const LinhaDivisora(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PrecoItem(
                  texto: 'Total:',
                  valor: total,
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
    );
  }
}
