import 'package:pokedex/domain/pokemon_meet.dart';

abstract class PokemonMeetRepository {
  Future<PokemonMeet> getPokemon({required int? id});
}
