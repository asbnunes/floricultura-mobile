import 'package:firebase_auth/firebase_auth.dart';
import 'package:floricultura/services/auth_services.dart';
import 'package:floricultura/widgets/botao_geral.dart';
import 'package:floricultura/widgets/divisor.dart';
import 'package:floricultura/widgets/widget_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/icone.dart';
import '../widgets/navigation_bar.dart';

class InfoUsuario extends StatefulWidget {
  const InfoUsuario({Key? key}) : super(key: key);

  @override
  _InfoUsuario createState() => _InfoUsuario();
}

class _InfoUsuario extends State<InfoUsuario> {
  final user = FirebaseAuth.instance.currentUser!;

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
                      WidgetTexto(
                        text: 'Login como: ${user.email!}',
                        tamanho: 20,
                      ),
                      SizedBox(height: 15),
                      const Botao(
                        text: 'Meus Pedidos',
                        screenName: 'meus-pedidos',
                      ),
                      SizedBox(height: 15),
                      Botao(
                        text: 'Sair',
                        onPressed: () => context.read<AuthService>().logout(),
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
