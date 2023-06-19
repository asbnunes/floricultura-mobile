import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_exceptions.dart';
import '../services/auth_services.dart';
import '../widgets/botao_retornar.dart';

class RedefinirSenha extends StatefulWidget {
  const RedefinirSenha({super.key});

  @override
  State<RedefinirSenha> createState() => _RedefinirSenhaState();
}

class _RedefinirSenhaState extends State<RedefinirSenha> {
  final _email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void resetCheck(){
    if(formKey.currentState!.validate()){
      passwordReset();
    }
  }

  Future<void> passwordReset() async {
    try {
      await context.read<AuthService>().redefinir(_email.text);
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context) {
        return const AlertDialog(
          content: Text('Link enviado com sucesso! Verifique seu email.')
        );
      }).then((value) {
        Navigator.pop(context);
      });
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o Email';
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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Retornar(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Preencha seu email e te enviaremos um link para redefinir a senha.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CampoTexto(
                        isEditable: true,
                        nome: 'Email',
                        validator: validateEmail,
                        controller: _email,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Botao(
                        text: 'Redefinir',
                        onPressed: resetCheck,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
