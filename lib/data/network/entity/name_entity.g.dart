// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameEntity _$NameEntityFromJson(Map<String, dynamic> json) => NameEntity(
      english: json['english'] as String,
      japanese: json['japanese'] as String,
      chinese: json['chinese'] as String,
      french: json['french'] as String,
    );

Map<String, dynamic> _$NameEntityToJson(NameEntity instance) =>
    <String, dynamic>{
      'english': instance.english,
      'japanese': instance.japanese,
      'chinese': instance.chinese,
      'french': instance.french,
    };
