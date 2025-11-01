import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String number;
  final String name;
  final List<String> types;
  final String imageUrl;
  final bool isFavorite;
  final Function()? onFavoritePressed;

  const PokemonCard({
    super.key,
    required this.number,
    required this.name,
    required this.types,
    required this.imageUrl,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'planta':
        return Colors.lightGreen;
      case 'fuego':
        return Colors.deepOrange;
      case 'veneno':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
  // Reemplazamos withOpacity por withAlpha (0.2 * 255 ~= 51)
  color: _getTypeColor(types.first).withAlpha(51),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nº$number',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: types.map((type) => _buildTypeChip(type)).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoritePressed,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
              child: Image(
                image: AssetImage(imageUrl),
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getTypeColor(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            type.toLowerCase() == 'planta' 
                ? Icons.grass 
                : type.toLowerCase() == 'fuego'
                    ? Icons.local_fire_department
                    : Icons.science,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            type,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}