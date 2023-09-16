import 'package:flutter/material.dart';
import 'package:pokedex_application/components/main_button.dart';
import 'package:pokedex_application/views/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg-pokemon.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(32),
              child: mainButton(
                  buttonText: 'Acessar Pokedex',
                  buttonCollor: const Color.fromARGB(255, 247, 51, 37),
                  buttonFunction: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginPage())
                    );
                  }),
            ),
            const SizedBox(
              height: 100,
            ),

          ],
        ),
      ),
    );
    // Foreground widget here
  }
}
