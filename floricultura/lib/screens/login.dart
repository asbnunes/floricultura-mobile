import 'package:flutter/material.dart';
import '../widgets/botao_novo_usuario.dart';
import '../widgets/campo_texto.dart';
import '../widgets/botao_geral.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                        text: 'Login',
                        screenName: 'home',
                      ),
                      RedirecionarCadastro(),
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
