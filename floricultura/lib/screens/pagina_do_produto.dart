import 'package:floricultura/models/flor.dart';
import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/imagem_header.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';

class PaginaDoProduto extends StatefulWidget {
  final Flor flor;

  const PaginaDoProduto({Key? key, required this.flor}) : super(key: key);

  @override
  _PaginaDoProdutoState createState() => _PaginaDoProdutoState();
}

class _PaginaDoProdutoState extends State<PaginaDoProduto> {
  late String corEscolhida;

  @override
  void initState() {
    super.initState();
    corEscolhida = widget.flor.corEscolhida;
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImagemHeader(imagem: widget.flor.imagem),
              Column(
                children: [
                  WidgetTexto(
                    text: widget.flor.preco,
                    tamanho: 30,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 10),
                  WidgetTexto(
                    text: widget.flor.nome,
                    tamanho: 25,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const WidgetTexto(
                text: 'Escolha a cor:',
                tamanho: 30,
                alignment: Alignment.center,
              ),
              Column(
                children: widget.flor.opcoesDeCores.map((color) {
                  return RadioListTile(
                    title: Text(color),
                    value: color,
                    groupValue: corEscolhida,
                    onChanged: (value) {
                      setState(() {
                        corEscolhida = value as String;
                      });
                    },
                  );
                }).toList(),
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
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
