import 'package:json_annotation/json_annotation.dart';

part 'pokemon_database_entity.g.dart';

@JsonSerializable()
class PokemonDatabaseEntity {
  @JsonKey(name: PokemonDatabaseContract.idColumn)
  final int? id;
  @JsonKey(name: PokemonDatabaseContract.nameColumn)
  final String? name;
  @JsonKey(name: PokemonDatabaseContract.typeFirstColumn)
  final String? typeFirts;
  @JsonKey(name: PokemonDatabaseContract.typeSecondColumn)
  final String? typeSecond;
  @JsonKey(name: PokemonDatabaseContract.imgThumbnailColumn)
  final String? imgThumbnailUrl;
  @JsonKey(name: PokemonDatabaseContract.imgSpriteUrlColumn)
  final String? imgSpriteUrl;
  @JsonKey(name: PokemonDatabaseContract.hpColumn)
  final int? hp;
  @JsonKey(name: PokemonDatabaseContract.attackColumn)
  final int? attack;
  @JsonKey(name: PokemonDatabaseContract.defenseColumn)
  final int? defense;
  @JsonKey(name: PokemonDatabaseContract.spAttackColumn)
  final int? spAttack;
  @JsonKey(name: PokemonDatabaseContract.spDefenseColumn)
  final int? spDefense;
  @JsonKey(name: PokemonDatabaseContract.speedColumn)
  final int? speed;

  PokemonDatabaseEntity({
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
  });

  factory PokemonDatabaseEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonDatabaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDatabaseEntityToJson(this);
}

abstract class PokemonDatabaseContract {
  static const String pokemonTable = "pokemon_table";
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
}
