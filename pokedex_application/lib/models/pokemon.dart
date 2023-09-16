class Pokemon {
  final int id;
  final String namepokemon;
  final double height;
  final double weight;
  final List<String> pokemonsprites;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.namepokemon,
    required this.height,
    required this.weight,
    required this.types,
    required this.pokemonsprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<dynamic> typesList = json['types'];
    final List<String> types = typesList.map((type) {
      return type['type']['name'].toString();
    }).toList();

    final Map<String, dynamic> spritesMap = json['sprites'];
    final List<String> sprites = [
      spritesMap['front_default'].toString(),
      spritesMap['back_default'].toString(),
      spritesMap['front_shiny'].toString(),
      spritesMap['back_shiny'].toString(),
    ];

    return Pokemon(
      id: json['id'],
      namepokemon: json['name'],
      height: (json['height'] ?? 0) / 10, // Convert to meters
      weight: (json['weight'] ?? 0) / 10, // Convert to kilograms
      types: types,
      pokemonsprites: sprites,
    );
  }
}