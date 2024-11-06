// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEntity _$PokemonEntityFromJson(Map<String, dynamic> json) =>
    PokemonEntity(
      id: json['id'] as String?,
      name: json['name'] == null
          ? null
          : NameEntity.fromJson(json['name'] as Map<String, dynamic>),
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      base: json['base'] == null
          ? null
          : BaseEntity.fromJson(json['base'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonEntityToJson(PokemonEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'base': instance.base,
    };
