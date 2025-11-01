import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/entities/pokemon.dart';

final pokemonRepositoryProvider = Provider((ref) => PokemonRepositoryImpl());

final pokemonListProvider = FutureProvider<List<Pokemon>>((ref) async {
  final repository = ref.watch(pokemonRepositoryProvider);
  return repository.getPokemons();
});