import 'package:floricultura/widgets/botao_imagem.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/icone.dart';
import 'package:floricultura/widgets/search_button.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_search_delegate.dart';
import '../widgets/navigation_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: SearchButton(),
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
