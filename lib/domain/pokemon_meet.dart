import 'package:freezed_annotation/freezed_annotation.dart';
import 'base.dart';

part 'pokemon_meet.freezed.dart';

@freezed
class PokemonMeet with _$PokemonMeet {
  const factory PokemonMeet({
    required int? id,
    required String? name,
    List<String>? type,
    Base? base,
    String? imgThumbnailUrl,
    String? imgSpriteUrl,
    String? dataGenerated,
  }) = _PokemonMeet;
}
