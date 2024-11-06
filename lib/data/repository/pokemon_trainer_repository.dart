import 'package:pokedex/domain/pokemon_meet.dart';

abstract class PokemonTrainerRepository {
  Future<List<PokemonMeet>> getPokemons();
  Future<void> capturePokemon(PokemonMeet pokemonCapture);
  Future<bool> releasePokemon(PokemonMeet pokemonRelease);
}
