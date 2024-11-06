// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_meet_db_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMeetDBEntity _$PokemonMeetDBEntityFromJson(Map<String, dynamic> json) =>
    PokemonMeetDBEntity(
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
      dataGenerated: json['dataGenerated'] as String?,
    );

Map<String, dynamic> _$PokemonMeetDBEntityToJson(
        PokemonMeetDBEntity instance) =>
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
      'dataGenerated': instance.dataGenerated,
    };
