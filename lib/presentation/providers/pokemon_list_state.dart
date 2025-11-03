import '../../domain/entities/pokemon.dart';

class PokemonListState {
  final List<Pokemon> pokemons;
  final bool isLoading;
  final bool hasError;
  final String? error;
  final bool hasReachedEnd;
  final int currentPage;

  PokemonListState({
    this.pokemons = const [],
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  PokemonListState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    bool? hasError,
    String? error,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return PokemonListState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}