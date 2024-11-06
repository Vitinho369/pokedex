import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';

class CapturePokemonProvider extends ChangeNotifier {
  final PokemonTrainerRepositoryImpl pokemonsRepoCap;

  CapturePokemonProvider({required this.pokemonsRepoCap});
  bool capture = false;

  void capturePokemon(PokemonMeet pokemonCapture) async {
    final pokemonsCaptured = await pokemonsRepoCap.getPokemons();
    PokemonMeet pokemonCap = PokemonMeet(
      id: pokemonCapture.id,
      name: pokemonCapture.name,
      imgThumbnailUrl: pokemonCapture.imgThumbnailUrl,
      imgSpriteUrl: pokemonCapture.imgSpriteUrl,
      type: pokemonCapture.type,
      base: pokemonCapture.base,
      dataGenerated:
          "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}",
    );

    for (var pokemon in pokemonsCaptured) {
      if (pokemon.id == pokemonCap.id &&
          pokemon.dataGenerated == pokemonCap.dataGenerated) {
        capture = false;
        notifyListeners();
      }
    }

    capture = true;
    notifyListeners();
  }
}
