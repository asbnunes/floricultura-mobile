import 'package:floricultura/widgets/botao_usuario_existente.dart';
import 'package:flutter/material.dart';

import '../widgets/campo_texto.dart';
import '../widgets/botao_geral.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});
  
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>{
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
        child: const Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: CampoTexto(
                              nome: 'Nome',
                              isEditable: true,
                            ),
                          ),
                          Flexible(
                            child: CampoTexto(
                              nome: 'Sobrenome',
                              isEditable: true,
                            ),
                          )
                        ],
                      ),
                      CampoTexto(
                        nome: 'Email',
                        isEditable: true,
                        textInputType: TextInputType.emailAddress,
                      ),
                      CampoTexto(
                        nome: 'Senha',
                        isEditable: true,
                        obscure: true,
                      ),
                      Botao(
                        text: 'Registrar',
                        screenName: 'home',
                      ),
                      RedirecionarLogin()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
