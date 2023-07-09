import 'package:floricultura/services/auth_services.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/campo_texto.dart';
import '../widgets/botao_geral.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String action;
  late String toggle;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem-vindo!';
        action = 'Login';
        toggle = 'Não possui conta? Cadastre-se agora!';
      } else {
        titulo = 'Criar conta';
        action = 'Cadastrar';
        toggle = 'Já possui conta? Faça o Login!';
      }
    });
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o Email';
    } else if (!RegExp(
            r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}(\.[a-z]{2,})?$')
        .hasMatch(value)) {
      return 'Email inválido';
    }
    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe a senha';
    } else if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WidgetTexto(
                  text: titulo,
                  tamanho: 35,
                  fontWeight: FontWeight.bold,
                ),
                CampoTexto(
                  nome: 'Email',
                  isEditable: true,
                  textInputType: TextInputType.emailAddress,
                  validator: validateEmail,
                  controller: email,
                ),
                CampoTexto(
                  nome: 'Senha',
                  isEditable: true,
                  obscure: true,
                  validator: validateSenha,
                  controller: senha,
                ),
                Botao(
                  text: action,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isLogin) {
                        login();
                      } else {
                        registrar();
                      }
                    }
                  },
                ),
                TextButton(
                  onPressed: () => setFormAction(!isLogin),
                  child: Text(toggle),
                ),
                Visibility(
                  visible: isLogin,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/redefinir');
                    },
                    child: const Text('Redefinir senha'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
