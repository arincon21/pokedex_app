import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
  Future<Pokemon> getPokemonById(String id);
  Future<void> toggleFavorite(String id);
}