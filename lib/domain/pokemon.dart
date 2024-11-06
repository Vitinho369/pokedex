import 'package:freezed_annotation/freezed_annotation.dart';
import 'base.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int? id,
    required String? name,
    List<String>? type,
    Base? base,
    String? imgThumbnailUrl,
    String? imgSpriteUrl,
  }) = _Pokemon;
}
