import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/navigation_bar.dart';
import 'package:floricultura/widgets/preview_itens.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icone(iconData: Icons.home),
                WidgetTexto(
                  text: 'Floricultura',
                  tamanho: 30,
                  alignment: Alignment.center,
                ),
                PreviewItens(text: 'Orquídeas'),
                PreviewItens(text: 'Rosas'),
                PreviewItens(text: 'Margaridas'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
