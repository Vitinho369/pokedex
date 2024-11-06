import 'package:json_annotation/json_annotation.dart';

part 'pokemon_trainer_entity.g.dart';

@JsonSerializable()
class PokemonTrainerEntity {
  @JsonKey(name: PokemonTrainerEntityContract.idColumn)
  final int? id;
  @JsonKey(name: PokemonTrainerEntityContract.nameColumn)
  final String? name;
  @JsonKey(name: PokemonTrainerEntityContract.typeFirstColumn)
  final String? typeFirts;
  @JsonKey(name: PokemonTrainerEntityContract.typeSecondColumn)
  final String? typeSecond;
  @JsonKey(name: PokemonTrainerEntityContract.imgThumbnailColumn)
  final String? imgThumbnailUrl;
  @JsonKey(name: PokemonTrainerEntityContract.imgSpriteUrlColumn)
  final String? imgSpriteUrl;
  @JsonKey(name: PokemonTrainerEntityContract.hpColumn)
  final int? hp;
  @JsonKey(name: PokemonTrainerEntityContract.attackColumn)
  final int? attack;
  @JsonKey(name: PokemonTrainerEntityContract.defenseColumn)
  final int? defense;
  @JsonKey(name: PokemonTrainerEntityContract.spAttackColumn)
  final int? spAttack;
  @JsonKey(name: PokemonTrainerEntityContract.spDefenseColumn)
  final int? spDefense;
  @JsonKey(name: PokemonTrainerEntityContract.speedColumn)
  final int? speed;
  @JsonKey(name: PokemonTrainerEntityContract.dataGeneratedColumn)
  final String? dataGenerated;

  PokemonTrainerEntity({
    required this.id,
    required this.name,
    required this.typeFirts,
    required this.typeSecond,
    this.imgThumbnailUrl,
    this.imgSpriteUrl,
    this.hp,
    this.attack,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.speed,
    this.dataGenerated,
  });

  factory PokemonTrainerEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonTrainerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTrainerEntityToJson(this);
}

abstract class PokemonTrainerEntityContract {
  static const String pokemonTrainerTable = "pokemon_trainer_table";
  static const String baseTable = "base_table";
  static const String idColumn = "id";
  static const String nameColumn = "name";
  static const String typeFirstColumn = "typeFirstColumn";
  static const String typeSecondColumn = "typeSecondColumn";
  static const String imgThumbnailColumn = "imgThumbnail";
  static const String imgSpriteUrlColumn = "imgSpriteUrl";
  static const String hpColumn = "hp";
  static const String attackColumn = "attack";
  static const String defenseColumn = "defense";
  static const String spAttackColumn = "spAttack";
  static const String spDefenseColumn = "spDefense";
  static const String speedColumn = "speed";
  static const String dataGeneratedColumn = "dataGenerated";
}
