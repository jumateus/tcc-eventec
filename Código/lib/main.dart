import 'package:eventec/view/cadastro_usuario.dart';
import 'package:eventec/view/config.dart';
import 'package:eventec/view/esqueceu_senha.dart';
import 'package:eventec/view/inserir_eventos.dart';
import 'package:eventec/view/login.dart';
import 'package:eventec/view/menu_principal.dart';
import 'package:eventec/view/sobre.dart';
import 'package:eventec/view/ver_eventos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'cadastro': (context) => CadastroUsuarioView(),
        'esqueceu': (context) => EsqueceuSenhaView(),
        'ver eventos': (context) => VerEventosView(),
        'menu': (context) => MenuPrincipalView(),
        'config': (context) => ConfigView(),
        'inserir evento': (context) => InserirEventoView(),
        'sobre': (context) => SobreView(),
      },
    );
  }
}
