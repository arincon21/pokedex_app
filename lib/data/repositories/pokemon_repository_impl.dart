import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  @override
  Future<List<Pokemon>> getPokemons() async {
    // Simulamos un pequeño retraso para mostrar el estado de carga
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      Pokemon(
        id: '001',
        name: 'BULBASAUR',
        types: ['PLANTA', 'VENENO'],
        // Usamos imagen de muestra incluida en el proyecto
        imageUrl: 'assets/images/OnboardingScreen 1.png',
        isFavorite: false,
      ),
      Pokemon(
        id: '002',
        name: 'IVYSAUR',
        types: ['PLANTA', 'VENENO'],
        imageUrl: 'assets/images/OnboardingScreen 2.png',
        isFavorite: true,
      ),
      Pokemon(
        id: '003',
        name: 'VENUSAUR',
        types: ['PLANTA', 'VENENO'],
        imageUrl: 'assets/images/OnboardingScreen 1.png',
        isFavorite: false,
      ),
      Pokemon(
        id: '004',
        name: 'CHARMANDER',
        types: ['FUEGO'],
        imageUrl: 'assets/images/OnboardingScreen 2.png',
        isFavorite: false,
      ),
      Pokemon(
        id: '005',
        name: 'CHARMELEON',
        types: ['FUEGO'],
        imageUrl: 'assets/images/OnboardingScreen 1.png',
        isFavorite: false,
      ),
    ];
  }

  @override
  Future<Pokemon> getPokemonById(String id) async {
    final pokemons = await getPokemons();
    return pokemons.firstWhere(
      (pokemon) => pokemon.id == id,
      orElse: () => throw Exception('Pokemon no encontrado'),
    );
  }

  @override
  Future<void> toggleFavorite(String id) async {
    // Por ahora no implementamos la persistencia de favoritos
    await Future.delayed(const Duration(milliseconds: 100));
  }
}