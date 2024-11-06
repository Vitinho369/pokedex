import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable()
class BaseEntity {
  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  BaseEntity({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory BaseEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseEntityFromJson(json);
}
