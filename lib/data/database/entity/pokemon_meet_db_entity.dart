import 'package:json_annotation/json_annotation.dart';

part 'pokemon_meet_db_entity.g.dart';

@JsonSerializable()
class PokemonMeetDBEntity {
  @JsonKey(name: PokemonMeetDBContract.idColumn)
  final int? id;
  @JsonKey(name: PokemonMeetDBContract.nameColumn)
  final String? name;
  @JsonKey(name: PokemonMeetDBContract.typeFirstColumn)
  final String? typeFirts;
  @JsonKey(name: PokemonMeetDBContract.typeSecondColumn)
  final String? typeSecond;
  @JsonKey(name: PokemonMeetDBContract.imgThumbnailColumn)
  final String? imgThumbnailUrl;
  @JsonKey(name: PokemonMeetDBContract.imgSpriteUrlColumn)
  final String? imgSpriteUrl;
  @JsonKey(name: PokemonMeetDBContract.hpColumn)
  final int? hp;
  @JsonKey(name: PokemonMeetDBContract.attackColumn)
  final int? attack;
  @JsonKey(name: PokemonMeetDBContract.defenseColumn)
  final int? defense;
  @JsonKey(name: PokemonMeetDBContract.spAttackColumn)
  final int? spAttack;
  @JsonKey(name: PokemonMeetDBContract.spDefenseColumn)
  final int? spDefense;
  @JsonKey(name: PokemonMeetDBContract.speedColumn)
  final int? speed;
  @JsonKey(name: PokemonMeetDBContract.dataGeneratedColumn)
  final String? dataGenerated;

  PokemonMeetDBEntity({
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

  factory PokemonMeetDBEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonMeetDBEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMeetDBEntityToJson(this);
}

abstract class PokemonMeetDBContract {
  static const String pokemonMeetTable = "pokemon_meet_table";
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
