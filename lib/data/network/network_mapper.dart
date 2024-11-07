import 'package:pokedex/data/network/entity/pokemon_entity.dart';
import 'package:pokedex/domain/base.dart';
import 'package:pokedex/domain/exception/mapper_exception.dart';
import 'package:pokedex/domain/pokemon.dart';

class NetworkMapper {
  Pokemon toPokemon(PokemonEntity entity) {
    try {
      return Pokemon(
        id: int.parse(entity.id!),
        name: entity.name!.english,
        type: entity.type,
        base: Base(
          hp: entity.base!.hp,
          attack: entity.base!.attack,
          defense: entity.base!.defense,
          spAttack: entity.base!.spAttack,
          spDefense: entity.base!.spDefense,
          speed: entity.base!.speed,
        ),
        imgSpriteUrl:
            "https://raw.githubusercontent.com/fanzeyi/pokemon.json/refs/heads/master/sprites/${entity.id.toString().padLeft(3, "0")}MS.png",
        imgThumbnailUrl:
            "https://raw.githubusercontent.com/fanzeyi/pokemon.json/refs/heads/master/images/${entity.id.toString().padLeft(3, "0")}.png",
      );
    } catch (e) {
      throw MapperException<PokemonEntity, Pokemon>(e.toString());
    }
  }

  List<Pokemon> toPokemons(List<PokemonEntity> entities) {
    final List<Pokemon> pokemons = [];
    for (var pokemonEntity in entities) {
      pokemons.add(toPokemon(pokemonEntity));
    }
    return pokemons;
  }

  Pokemon toSortedPokemons(PokemonEntity entitiy) {
    return toPokemon(entitiy);
  }
}
