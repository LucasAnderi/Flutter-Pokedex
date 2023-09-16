import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_application/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonController {
  static final PokemonController instance = PokemonController();

  static const _baseURL = 'https://pokeapi.co/api/v2/pokemon/';
  late SharedPreferences _prefs;

  Future<Pokemon> findPokemonByName(String nameidpokemon) async {
    _prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(
      Uri.parse('$_baseURL$nameidpokemon'),
      headers: <String, String>{
        'Authorization': 'Bearer ${_prefs.get('token')}',
        'Content-Type': 'application/json'
      },// sei que nao precisa desse headers pq essa api nao autentica
    );

    if (response.statusCode == 200) {
      Pokemon pokemon = Pokemon.fromJson(jsonDecode(response.body));
      return pokemon;
    } else {
      throw Exception('Falha ao buscar pokemão');
    }
  }
}
