// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_paged_result_meet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpPagedResultMeet _$HttpPagedResultMeetFromJson(Map<String, dynamic> json) =>
    HttpPagedResultMeet(
      id: json['id'] as String,
      name: NameEntity.fromJson(json['name'] as Map<String, dynamic>),
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      base: BaseEntity.fromJson(json['base'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HttpPagedResultMeetToJson(
        HttpPagedResultMeet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'base': instance.base,
    };
