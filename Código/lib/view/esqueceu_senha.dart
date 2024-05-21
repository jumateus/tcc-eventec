import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    home: EsqueceuSenhaView(),
  ));
}

class EsqueceuSenhaView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Esqueceu a Senha?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            Text(
              'Digite seu endereço de e-mail abaixo para receber instruções de redefinição de senha.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),

            // Campo de texto para o email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),

            // Botões "Enviar Instruções" e "Cancelar"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botão para solicitar a redefinição de senha
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text;

                    if (isValidEmail(email)) {
                      try {
                        await _auth.sendPasswordResetEmail(email: email);

                        // Exibir o Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Instruções enviadas para o seu e-mail!'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } catch (e) {
                        // Trate o erro ou mostre um alerta
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erro ao Enviar Instruções'),
                              content: Text('Ocorreu um erro ao enviar as instruções. Verifique o e-mail e tente novamente.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      // Exibir AlertDialog se o e-mail não for válido
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('E-mail Inválido'),
                            content: Text('Por favor, insira um e-mail válido.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),

                // Botão "Cancelar" para voltar à tela de login
                ElevatedButton(
                  onPressed: () {
                    // Navegar de volta à tela de login
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função para validar o e-mail
  bool isValidEmail(String email) {
    // Adicione aqui a lógica para validar o e-mail conforme necessário
    return email.contains('@');
  }
}
