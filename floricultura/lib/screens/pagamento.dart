import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:flutter/material.dart';
import 'package:floricultura/widgets/botao_retornar.dart';
import '../widgets/campo_texto.dart';

import '../widgets/preco_item.dart';
import '../widgets/widget_texto.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({Key? key}) : super(key: key);

  @override
  _PagamentoState createState() => _PagamentoState();

}

class _PagamentoState extends State<Pagamento>{
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
              const Retornar(),
              const WidgetTexto(
                text: 'Pagamento e Entrega',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: PrecoItem(
                  texto: 'Total:',
                  valor: 350.00,
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
                child: const Botao(
                  text: 'Finalizar Compra',
                  screenName: 'home',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
