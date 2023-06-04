import 'package:floricultura/widgets/botao_imagem.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';

class PedidoAnterior extends StatelessWidget {
  final String nomePedido;
  final String dataPedido;
  final String statusPedido;
  final double? tamanho;
  final Alignment alignment;
  final FontWeight? fontWeight;
  final String imagem;

  const PedidoAnterior(
      {Key? key,
      this.tamanho,
      required this.nomePedido,
      required this.dataPedido,
      required this.statusPedido,
      required this.alignment,
      this.fontWeight, required this.imagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size.fromHeight(125),
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: const Color(0xffffb3b3),
          foregroundColor: const Color(0xff6c4848),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/detalhes-pedido');
        },
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagem,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  WidgetTexto(
                    text: nomePedido,
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w400,
                  ),
                  WidgetTexto(
                    text: dataPedido,
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w400,
                  ),
                  WidgetTexto(
                    text: statusPedido,
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
