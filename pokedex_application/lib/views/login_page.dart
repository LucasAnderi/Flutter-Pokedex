import 'package:flutter/material.dart';
import 'package:pokedex_application/controller/access_controller.dart';
import 'package:pokedex_application/views/pokedex_page.dart';
import 'package:pokedex_application/components/form_text_field.dart';
import 'package:pokedex_application/components/main_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 51, 37),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormTextField(
                labelText: 'Usuário',
                hintText: 'Usuário',
                textController: _usernameController,
                iconInput: const Icon(Icons.person_outline),
                inputValidator: (username) {
                  if (username == null || username.isEmpty) {
                    return 'Preencha usuário ou senha!';
                  }
                  return null;
                },
              ),
              FormTextField(
                labelText: 'Senha',
                hintText: 'Senha',
                textController: _passwordController,
                iconInput: const Icon(Icons.security),
                obscureText: true,
                inputValidator: (passwd) {
                  if (passwd == null || passwd.isEmpty) {
                    return 'Preencha usuário ou senha!';
                  }
                },
              ),
              const SizedBox(height: 20),
              mainButton(
                buttonText: 'Entrar',
                buttonCollor: const Color.fromARGB(255, 247, 51, 37),
                buttonFunction: () async {
                  final navigator = Navigator.of(context);
                  final messenger = ScaffoldMessenger.of(context);

                  if (_formKey.currentState!.validate()) {
                    bool loginSuccess = await AccessController.instance.login(
                        _usernameController.text, _passwordController.text);
                    if (loginSuccess) {
                      navigator.pushReplacement(MaterialPageRoute(
                        builder: (context) => const PokedexPage(),
                      ));
                    } else {
                      messenger.showSnackBar(const SnackBar(
                        content: Text('Usuário e/ou senhas incorretos'),
                        backgroundColor: Color.fromARGB(255, 247, 51, 37),
                      ));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}