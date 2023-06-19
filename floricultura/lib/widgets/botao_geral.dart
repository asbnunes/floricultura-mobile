import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String text;
  final String? screenName;
  final VoidCallback? onPressed;
  const Botao({Key? key, required this.text, this.screenName, this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routes = {
      'catalogo' : '/catalogo',
      'main' : '/main',
      'detalhes-pedido' : '/detalhes-pedido',
      'produto-page' : '/produto-page',
      'pagamento' : '/pagamento',
      'meus-pedidos': '/meus-pedidos',
    };

    void navigate(){
      final routeName = routes[screenName];
          if (routeName != null) {
            Navigator.pushNamed(context, routeName);
          }
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size.fromHeight(50),
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: const Color(0xffffb3b3),
          foregroundColor: const Color(0xff6c4848),
        ),
        onPressed: onPressed ?? navigate,
        child: Text(text),
      ),
    );
  }
}
