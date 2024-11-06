import 'package:json_annotation/json_annotation.dart';

part 'name_entity.g.dart';

@JsonSerializable()
class NameEntity {
  String english;
  String japanese;
  String chinese;
  String french;

  NameEntity({
    required this.english,
    required this.japanese,
    required this.chinese,
    required this.french,
  });

  factory NameEntity.fromJson(Map<String, dynamic> json) =>
      _$NameEntityFromJson(json);
}
