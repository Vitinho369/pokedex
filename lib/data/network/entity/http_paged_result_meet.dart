import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/network/entity/base_entity.dart';
import 'package:pokedex/data/network/entity/name_entity.dart';
import 'package:pokedex/data/network/entity/pokemon_entity.dart';

part 'http_paged_result_meet.g.dart';

@JsonSerializable()
class HttpPagedResultMeet extends PokemonEntity {
  HttpPagedResultMeet({
    required String id,
    required NameEntity name,
    required List<String> type,
    required BaseEntity base,
  }) : super(id: id, name: name, type: type, base: base);

  factory HttpPagedResultMeet.fromJson(Map<String, dynamic> json) =>
      _$HttpPagedResultMeetFromJson(json);
}
