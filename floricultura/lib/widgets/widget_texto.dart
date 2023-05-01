import 'package:flutter/material.dart';

class WidgetTexto extends StatelessWidget {
  final String text;
  final double? tamanho;
  final Alignment alignment;
  final FontWeight? fontWeight;

  const WidgetTexto(
      {Key? key,
      required this.text,
      this.tamanho,
      required this.alignment,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: tamanho,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
