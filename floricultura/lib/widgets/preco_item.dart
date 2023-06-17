import 'package:floricultura/utils/formatador_texto.dart';
import 'package:flutter/material.dart';

class PrecoItem extends StatelessWidget {
  final String texto;
  final double valor;
  final double? fontSize;

  const PrecoItem(
      {Key? key,
      required this.texto,
      required this.valor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    String valorFormatado = FormatadorPreco.formatPrice(valor);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            texto,
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            valorFormatado,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
