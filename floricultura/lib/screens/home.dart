import 'package:floricultura/models/loja_flores.dart';
import 'package:floricultura/widgets/flor_tile.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/flor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LojaFlores>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
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
                children: [
                  const Icone(iconData: Icons.home),
                  const WidgetTexto(
                    text: 'Nosso Catálogo',
                    tamanho: 30,
                    alignment: Alignment.center,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.catalogoFlores.length,
                      itemBuilder: (context, index) {
                        Flor flores = value.catalogoFlores[index];
                        return FlorTile(flor: flores, icon: const Icon(Icons.navigate_next));
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
