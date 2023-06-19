import 'package:floricultura/models/loja_flores.dart';
import 'package:floricultura/screens/detalhes_do_pedido.dart';
import 'package:floricultura/screens/historico_de_pedidos.dart';
import 'package:floricultura/screens/pagamento.dart';
import 'package:floricultura/screens/redefinir_senha.dart';
import 'package:floricultura/services/auth_services.dart';
import 'package:floricultura/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LojaFlores(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthCheck(),
          '/detalhes-pedido': (context) => const DetalhesPedido(),
          '/pagamento': (context) => const Pagamento(),
          '/meus-pedidos': (context) => const HistoricoPedidos(),
          '/redefinir':(context) => const RedefinirSenha(),
        },
      ),
    );
  }
}
