import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  final bool isEditable;
  final TextEditingController? controller;
  final String? nome;
  final bool obscure;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const CampoTexto(
      {Key? key,
      required this.isEditable,
      this.controller,
      required this.nome,
      this.obscure = false,
      this.textInputType = TextInputType.text,
      this.validator,
      })
      : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

static String? defaultValidator(String? value) => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: const Color(0xfff4f4f4),
          border: Border.all(
            color: const Color(0xffC7C7C7),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: widget.controller,
          enabled: widget.isEditable,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.nome,
          ),
          keyboardType: widget.textInputType,
          obscureText: widget.obscure,
          validator: widget.validator ?? defaultValidator,
        ),
      ),
    );
  }
}
