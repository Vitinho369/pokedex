import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/domain/pokemon.dart';

part 'pokemon_trainer.freezed.dart';

@freezed
class PokemonTrainer with _$PokemonTrainer {
  const factory PokemonTrainer({
    required List<Pokemon>? pokemons,
  }) = _PokemonTrainer;
}
