// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEntity _$BaseEntityFromJson(Map<String, dynamic> json) => BaseEntity(
      hp: (json['HP'] as num).toInt(),
      attack: (json['Attack'] as num).toInt(),
      defense: (json['Defense'] as num).toInt(),
      spAttack: (json['Sp. Attack'] as num).toInt(),
      spDefense: (json['Sp. Defense'] as num).toInt(),
      speed: (json['Speed'] as num).toInt(),
    );

Map<String, dynamic> _$BaseEntityToJson(BaseEntity instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
    };
