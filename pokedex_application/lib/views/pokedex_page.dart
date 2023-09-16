import 'package:flutter/material.dart';
import 'package:pokedex_application/controller/pokemon_controller.dart';
import 'package:pokedex_application/models/pokemon.dart';
import 'package:pokedex_application/views/pokemon_detail.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 51, 37),
        title: const Text('Pesquisa de Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Insira o ID ou nome do Pokémon",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Digite aqui",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 247, 51, 37),
              ),
              onPressed: () async {
                final String searchText =
                    _searchController.text.toLowerCase();
                Pokemon pokemon = await PokemonController.instance
                    .findPokemonByName(searchText);
                if (pokemon != null) {
                  final navigator = Navigator.of(context);
                  navigator.push(MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailPage(pokemon: pokemon)));
                } else {
                  // Handle error
                }
              },
              child: const Text(
                'Pesquisar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}