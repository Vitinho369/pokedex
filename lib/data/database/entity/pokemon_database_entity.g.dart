// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDatabaseEntity _$PokemonDatabaseEntityFromJson(
        Map<String, dynamic> json) =>
    PokemonDatabaseEntity(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      typeFirts: json['typeFirstColumn'] as String?,
      typeSecond: json['typeSecondColumn'] as String?,
      imgThumbnailUrl: json['imgThumbnail'] as String?,
      imgSpriteUrl: json['imgSpriteUrl'] as String?,
      hp: (json['hp'] as num?)?.toInt(),
      attack: (json['attack'] as num?)?.toInt(),
      defense: (json['defense'] as num?)?.toInt(),
      spAttack: (json['spAttack'] as num?)?.toInt(),
      spDefense: (json['spDefense'] as num?)?.toInt(),
      speed: (json['speed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PokemonDatabaseEntityToJson(
        PokemonDatabaseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeFirstColumn': instance.typeFirts,
      'typeSecondColumn': instance.typeSecond,
      'imgThumbnail': instance.imgThumbnailUrl,
      'imgSpriteUrl': instance.imgSpriteUrl,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
    };
