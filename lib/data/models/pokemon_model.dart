class PokemonModel {
  final String id;
  final String name;
  final List<String> types;
  final String imageUrl;
  final bool isFavorite;

  PokemonModel({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory PokemonModel.fromDetailJson(Map<String, dynamic> json) {
    final id = (json['id'] ?? 0).toString().padLeft(3, '0');
    final types = <String>[];
    
    if (json['types'] is List) {
      for (final type in json['types']) {
        if (type is Map && type['type'] is Map) {
          final name = type['type']['name']?.toString();
          if (name != null) types.add(name.toUpperCase());
        }
      }
    }

    final sprites = json['sprites'] as Map<String, dynamic>?;
    final other = sprites?['other'] as Map<String, dynamic>?;
    final artwork = other?['official-artwork'] as Map<String, dynamic>?;
    
    final image = artwork?['front_default']?.toString() ?? 
                 sprites?['front_default']?.toString() ?? '';

    return PokemonModel(
      id: id,
      name: (json['name'] ?? '').toString().toUpperCase(),
      types: types,
      imageUrl: image,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'types': types,
    'imageUrl': imageUrl,
    'isFavorite': isFavorite,
  };
}
