// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
  id: json['id'] as String,
  name: json['name'] as String,
  types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
  imageUrl: json['imageUrl'] as String,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.types,
  'imageUrl': instance.imageUrl,
  'isFavorite': instance.isFavorite,
};
