import 'package:floricultura/models/flor.dart';
import 'package:floricultura/models/loja_flores.dart';
import 'package:floricultura/utils/formatador_texto.dart';
import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/imagem_header.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    
    void addCarrinho(Flor flor) {
      Flor copyFlor = Flor(
        nome: flor.nome,
        preco: flor.preco,
        imagem: flor.imagem,
        opcoesDeCores: List<String>.from(flor.opcoesDeCores),
        corEscolhida: flor.corEscolhida,
      );

      Provider.of<LojaFlores>(context, listen: false)
          .adicionarAoCarrinho(copyFlor);

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Adicionado ao carrinho com sucesso"),
        ),
      ).then((value) {
        Navigator.pop(context);
      });
    }

    String precoFormatado = FormatadorPreco.formatPrice(widget.flor.preco);

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
                    text: precoFormatado,
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
                        corEscolhida = value.toString();
                        widget.flor.corEscolhida = corEscolhida;
                      });
                    },
                  );
                }).toList(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Botao(
                  text: 'Adicionar ao carrinho',
                  onPressed: () => addCarrinho(widget.flor),
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
