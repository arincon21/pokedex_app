class ApiConstants {
  static const String baseUrl = 'https://pokeapi.co/api/v2';
  static const String pokemonEndpoint = '$baseUrl/pokemon';
  
  static String getPokemonDetailsEndpoint(String name) => '$pokemonEndpoint/$name';
}