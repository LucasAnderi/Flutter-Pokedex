import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 51, 37),
        title: Text("Detalhes do ${pokemon.namepokemon}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildInfoCard("Nome", pokemon.namepokemon),
            _buildInfoCard("ID", pokemon.id.toString()),
            _buildInfoCard("Altura", "${pokemon.height} m"),
            _buildInfoCard("Peso", "${pokemon.weight} kg"),
            _buildInfoCard(
                "Tipos", pokemon.types.map((type) => type.capitalize()).join(', ')),
            _buildSpritesCard(pokemon.pokemonsprites),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSpritesCard(List<String> sprites) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: const Text(
          "Sprites",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: sprites
                  .map((sprite) => Image.network(
                        sprite,
                        height: 80,
                        width: 80,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}