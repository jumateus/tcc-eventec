
import 'package:eventec/view/cadastro_usuario.dart';
import 'package:eventec/view/esqueceu_senha.dart';
import 'package:eventec/view/menu_principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MaterialApp(
    home: LoginView(),
  ));
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícone de login
              Icon(
                Icons.school,
                size: 150.0,
                color: Colors.blue,
              ),
              // Título "EvenTec"
              Text(
                'EvenTec',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 50.0),

              // Campo de texto para o email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              SizedBox(height: 16.0),

              // Campo de texto para a senha
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              SizedBox(height: 16.0),

              // Botão "Entrar"
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = senhaController.text;

                  if (isValidEmail(email) && password.isNotEmpty) {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: email, password: password);

                      // Verifique se o login foi bem-sucedido
                      if (userCredential.user != null) {
                        // Navegue para a próxima tela (ou execute qualquer outra ação)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuPrincipalView(),
                          ),
                        );
                      } else {
                        // Trate o erro ou mostre um alerta
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erro'),
                              content: Text('Falha no login. Verifique suas credenciais.'),
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
                    } catch (e) {
                      // Trate o erro ou mostre um alerta
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erro'),
                            content: Text('Autenticação falhou: $e'),
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
                    // Mostre um alerta para e-mail inválido ou senha vazia
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erro de Autenticação'),
                          content: Text(
                            'Por favor, insira um e-mail válido e uma senha não vazia.',
                          ),
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
                child: Text('Entrar'),
              ),
              SizedBox(height: 16.0),

              // Links "Cadastrar" e "Esqueceu senha?"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Link "Cadastrar"
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroUsuarioView(),
                        ),
                      );
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                  // Link "Esqueceu senha?"
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de recuperação de senha
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EsqueceuSenhaView(),
                        ),
                      );
                    },
                    child: Text(
                      'Esqueceu senha?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 200.0),
            ],
          ),
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