import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:flutter/material.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database/pedido_repository.dart';
import '../models/loja_flores.dart';
import '../models/pedido.dart';
import '../services/auth_services.dart';
import '../widgets/bottom_nav_bar.dart';
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
  final formKey = GlobalKey<FormState>();
  final numeroCartao = TextEditingController();
  final titular = TextEditingController();
  final cvv = TextEditingController();
  final vencimento = TextEditingController();

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
        id: '',
      );

      try {
        await pedidoRepository.placePedido(pedido, userId);
      } catch (e) {
        print('Error placing order: $e');
      }
    }

    String? validateTitular(String? value) {
      if (value == null || value.isEmpty) {
        return 'Informe o nome do titular.';
      }
      return null;
    }

    String? validateCvv(String? value) {
      if (value == null || value.isEmpty) {
        return 'Informe o valor do CVV.';
      } else if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) {
        return 'CVV inválido.';
      }
      return null;
    }

    String? validateNumeroCartao(String? value) {
      if (value == null || value.isEmpty) {
        return 'Informe o número do cartão';
      }
      int length = value.length;
      int sum = 0;
      bool isEven = false;

      for (int i = length - 1; i >= 0; i--) {
        int digit = int.parse(value[i]);

        if (isEven) {
          digit *= 2;
          if (digit > 9) {
            digit -= 9;
          }
        }

        sum += digit;
        isEven = !isEven;
      }
      return sum % 10 == 0 ? null : 'Valor do cartão é Inválido.';
    }

    String? validateVencimento(String? value) {
      if (value == null || value.isEmpty) {
        return 'Informe a data de vencimento';
      }

      final dateParts = value.split('/');
      if (dateParts.length != 2) {
        return 'Data inválida';
      }

      final month = int.tryParse(dateParts[0]);
      final year = int.tryParse(dateParts[1]);

      if (month == null || year == null || month < 1 || month > 12) {
        return 'Data inválida';
      }

      final now = DateTime.now();
      final selectedDate = DateFormat('MM/yyyy').parse(value, true);

      if (selectedDate.isBefore(now) || selectedDate.year > now.year + 10) {
        return 'Data inválida';
      }

      return null;
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Retornar(),
                  const Icone(iconData: Icons.sell),
                  const WidgetTexto(
                    text: 'Pagamento',
                    tamanho: 30,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 20),
                  CampoTexto(
                    nome: 'Numero do Cartao',
                    isEditable: true,
                    textInputType: TextInputType.number,
                    validator: validateNumeroCartao,
                    controller: numeroCartao,
                  ),
                  CampoTexto(
                    nome: 'Nome do Titular',
                    isEditable: true,
                    textInputType: TextInputType.name,
                    validator: validateTitular,
                    controller: titular,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CampoTexto(
                          isEditable: true,
                          nome: 'CVV',
                          textInputType: TextInputType.number,
                          validator: validateCvv,
                          controller: cvv,
                        ),
                      ),
                      Expanded(
                        child: CampoTexto(
                          isEditable: true,
                          nome: 'Vencimento (MM/YYYY)',
                          textInputType: TextInputType.datetime,
                          validator: validateVencimento,
                          controller: vencimento,
                        ),
                      ),
                    ],
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
                  Container(
                    height: 45,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Botao(
                      text: 'Finalizar Compra',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          comprar(value);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text('Compra Efetuada com sucesso!'),
                              );
                            },
                          ).then((value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                              (route) => false,
                            );
                          });
                          value.esvaziarCarrinho();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
