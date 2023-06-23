import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:flutter/material.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import 'package:provider/provider.dart';
import '../database/pedido_repository.dart';
import '../models/loja_flores.dart';
import '../models/pedido.dart';
import '../services/auth_services.dart';
import '../widgets/campo_texto.dart';

import '../widgets/icone.dart';
import '../widgets/preco_item.dart';
import '../widgets/widget_texto.dart';

class Pagamento extends StatefulWidget {
  final double total;
  const Pagamento({Key? key, required this.total}) : super(key: key);

  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    PedidoRepository pedidoRepository = PedidoRepository();
    AuthService authService = Provider.of<AuthService>(context);

    void comprar(LojaFlores value) async {
      List<String> itens = value.carrinho.map((flor) {
        return '${flor.nome} ${flor.corEscolhida}';
      }).toList();

      String userId = authService.usuario?.id ?? '';

      Pedido pedido = Pedido(
        userId: userId,
        itens: itens,
        total: widget.total,
      );

      try {
        await pedidoRepository.placePedido(pedido, userId);
        value.esvaziarCarrinho();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Compra Efetuada com sucesso!'),
            );
          },
        );
        Navigator.pop(context);
      } catch (e) {
        print('Error placing order: $e');
      }
    }

    return Consumer<LojaFlores>(
      builder: (context, value, child) => Scaffold(
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
                const Retornar(),
                const Icone(iconData: Icons.sell),
                const WidgetTexto(
                  text: 'Pagamento',
                  tamanho: 30,
                  alignment: Alignment.center,
                ),
                const CampoTexto(
                  nome: 'Endereco',
                  isEditable: true,
                  textInputType: TextInputType.streetAddress,
                ),
                const SizedBox(height: 20),
                const LinhaDivisora(),
                const SizedBox(height: 20),
                const CampoTexto(
                  nome: 'Numero do Cartao',
                  isEditable: true,
                  textInputType: TextInputType.number,
                ),
                const CampoTexto(
                  nome: 'Nome do Titular',
                  isEditable: true,
                  textInputType: TextInputType.name,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CampoTexto(
                        isEditable: true,
                        nome: 'CVV',
                        textInputType: TextInputType.visiblePassword,
                      ),
                    ),
                    Expanded(
                      child: CampoTexto(
                        isEditable: true,
                        nome: 'Vencimento',
                        textInputType: TextInputType.datetime,
                      ),
                    ),
                  ],
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: PrecoItem(
                    texto: 'Total:',
                    valor: widget.total,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                const LinhaDivisora(),
                const SizedBox(height: 20),
                Container(
                  height: 45,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Botao(
                    text: 'Finalizar Compra',
                    onPressed: () => comprar(value),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
