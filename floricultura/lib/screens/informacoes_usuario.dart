import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/botao_editar_info.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';

import '../widgets/campo_texto.dart';
import '../widgets/icone.dart';
import '../widgets/navigation_bar.dart';

class InfoUsuario extends StatefulWidget {
  const InfoUsuario({Key? key}) : super(key: key);

  @override
  _InfoUsuario createState() => _InfoUsuario();
}

class _InfoUsuario extends State<InfoUsuario> {
  bool _isEditable = false;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = "André";
    _sobrenomeController.text = "Bucar";
    _emailController.text = "email@iesb.edu.br";
    _senhaController.text = "senhasenha";
  }

  void toggleEdit() {
    setState(
      () {
        _isEditable = !_isEditable;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icone(iconData: Icons.account_circle),
            const WidgetTexto(
              text: 'Minha Conta',
              alignment: Alignment.center,
              tamanho: 30,
            ),
            const LinhaDivisora(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: CampoTexto(
                              nome: 'Nome',
                              isEditable: _isEditable,
                              controller: _nomeController,
                            ),
                          ),
                          Flexible(
                            child: CampoTexto(
                              nome: 'Sobreome',
                              isEditable: _isEditable,
                              controller: _sobrenomeController,
                            ),
                          )
                        ],
                      ),
                      CampoTexto(
                        nome: 'Email',
                        isEditable: _isEditable,
                        controller: _emailController,
                      ),
                      CampoTexto(
                        nome: 'Senha',
                        isEditable: _isEditable,
                        controller: _senhaController,
                        obscure: true,
                      ),
                      CampoTexto(
                        nome: 'Telefone',
                        isEditable: _isEditable,
                      ),
                      BotaoEditarInfo(
                        onPressed: toggleEdit,
                        isEditable: _isEditable,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                        child: FractionallySizedBox(
                          widthFactor: 0.3,
                          child: Botao(
                            text: 'Sair',
                            screenName: 'login',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
