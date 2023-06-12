import 'package:flutter/material.dart';
import '../widgets/botao_novo_usuario.dart';
import '../widgets/campo_texto.dart';
import '../widgets/botao_geral.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

    @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();

  void login() {
  if (formKey.currentState?.validate() == true) {
    const routeName = '/home';
    Navigator.pushNamed(context, routeName);
  }
}

  String? validate(String? value){
    if(value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
      return null;
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
          children: [
            Expanded(
              child: Padding(
                padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CampoTexto(
                        nome: 'Email',
                        isEditable: true,
                        textInputType: TextInputType.emailAddress,
                        validator: validate,
                      ),
                      CampoTexto(
                        nome: 'Senha',
                        isEditable: true,
                        obscure: true,
                        validator: validate,
                      ),
                      Botao(
                        text: 'Login',
                        onPressed: login,
                      ),
                      const RedirecionarCadastro(),
                      TextButton(onPressed:() {}, child: const Text('Redefinir senha'))
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
