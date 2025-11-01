import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pokemon_provider.dart';
import '../widgets/pokemon_card.dart';
import '../widgets/pokemon_search_bar.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PokemonSearchBar(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              onSubmitted: () {
                final query = _searchController.text.toLowerCase();
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            Expanded(
              child: ref.watch(pokemonListProvider).when(
                data: (pokemons) {
                  final filteredPokemons = pokemons.where((pokemon) =>
                    pokemon.name.toLowerCase().contains(_searchQuery) ||
                    pokemon.id.contains(_searchQuery)
                  ).toList();

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemons[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PokemonCard(
                          number: pokemon.id,
                          name: pokemon.name,
                          types: pokemon.types,
                          imageUrl: pokemon.imageUrl,
                          isFavorite: pokemon.isFavorite,
                          onFavoritePressed: () {
                            // Implementar la lógica de favoritos
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Cargando Pokémon...'),
                    ],
                  ),
                ),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: Colors.red),
                      SizedBox(height: 16),
                      Text('Error: $error'),
                      TextButton(
                        onPressed: () {
                          ref.invalidate(pokemonListProvider);
                        },
                        child: Text('Intentar de nuevo'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}