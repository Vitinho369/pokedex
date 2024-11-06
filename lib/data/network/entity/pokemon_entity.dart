import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/network/entity/base_entity.dart';
import 'package:pokedex/data/network/entity/name_entity.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class PokemonEntity {
  String? id;
  NameEntity? name;
  List<String>? type;
  BaseEntity? base;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.base,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);

  @override
  String toString() {
    return 'PokemonEntity{title: $name, id: $id}';
  }
}
