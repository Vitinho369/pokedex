import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/database/entity/pokemon_meet_db_entity.dart';
import 'package:pokedex/domain/base.dart';
import 'package:pokedex/domain/exception/mapper_exception.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/domain/pokemon_meet.dart';

class DatabaseMapper {
  Pokemon toPokemon(PokemonDatabaseEntity entityPokemon) {
    try {
      return Pokemon(
        id: entityPokemon.id!,
        name: entityPokemon.name!,
        type: [entityPokemon.typeFirts ?? '', entityPokemon.typeSecond ?? ''],
        base: Base(
          hp: entityPokemon.hp!,
          attack: entityPokemon.attack!,
          defense: entityPokemon.defense!,
          spAttack: entityPokemon.spAttack!,
          spDefense: entityPokemon.spDefense!,
          speed: entityPokemon.speed!,
        ),
        imgSpriteUrl: entityPokemon.imgSpriteUrl,
        imgThumbnailUrl: entityPokemon.imgThumbnailUrl,
      );
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  PokemonMeet toPokemonMeet(PokemonMeetDBEntity entityPokemon) {
    try {
      return PokemonMeet(
        id: entityPokemon.id!,
        name: entityPokemon.name!,
        type: [entityPokemon.typeFirts ?? '', entityPokemon.typeSecond ?? ''],
        base: Base(
          hp: entityPokemon.hp!,
          attack: entityPokemon.attack!,
          defense: entityPokemon.defense!,
          spAttack: entityPokemon.spAttack!,
          spDefense: entityPokemon.spDefense!,
          speed: entityPokemon.speed!,
        ),
        imgSpriteUrl: entityPokemon.imgSpriteUrl,
        imgThumbnailUrl: entityPokemon.imgThumbnailUrl,
        dataGenerated: entityPokemon.dataGenerated,
      );
    } catch (e) {
      throw MapperException<PokemonMeetDBEntity, PokemonMeet>(e.toString());
    }
  }

  PokemonMeetDBEntity toPokemonMeetDBEntity(Pokemon entityPokemon) {
    try {
      return PokemonMeetDBEntity(
        id: entityPokemon.id!,
        name: entityPokemon.name!,
        typeFirts: entityPokemon.type![0],
        typeSecond:
            entityPokemon.type!.length > 1 ? entityPokemon.type![1] : null,
        hp: entityPokemon.base!.hp,
        attack: entityPokemon.base!.attack,
        defense: entityPokemon.base!.defense,
        spAttack: entityPokemon.base!.spAttack,
        spDefense: entityPokemon.base!.spDefense,
        speed: entityPokemon.base!.speed,
        imgSpriteUrl: entityPokemon.imgSpriteUrl,
        imgThumbnailUrl: entityPokemon.imgThumbnailUrl,
        dataGenerated:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      );
    } catch (e) {
      throw MapperException<PokemonMeetDBEntity, PokemonMeet>(e.toString());
    }
  }

  List<Pokemon> toPokemons(List<PokemonDatabaseEntity> entities) {
    final List<Pokemon> pokemons = [];
    for (var pokemonEntity in entities) {
      pokemons.add(toPokemon(pokemonEntity));
    }
    return pokemons;
  }

  PokemonDatabaseEntity toPokemonDatabaseEntity(Pokemon pokemon) {
    try {
      return PokemonDatabaseEntity(
        id: pokemon.id,
        name: pokemon.name,
        typeFirts: pokemon.type![0],
        typeSecond: pokemon.type!.length > 1 ? pokemon.type![1] : null,
        hp: pokemon.base!.hp,
        attack: pokemon.base!.attack,
        defense: pokemon.base!.defense,
        spAttack: pokemon.base!.spAttack,
        spDefense: pokemon.base!.spDefense,
        speed: pokemon.base!.speed,
        imgSpriteUrl: pokemon.imgSpriteUrl,
        imgThumbnailUrl: pokemon.imgThumbnailUrl,
      );
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  List<PokemonDatabaseEntity> toPokemonDatabaseEntities(
      List<Pokemon> pokemons) {
    final List<PokemonDatabaseEntity> pokemonDatabaseEntities = [];
    for (var m in pokemons) {
      pokemonDatabaseEntities.add(toPokemonDatabaseEntity(m));
    }
    return pokemonDatabaseEntities;
  }
}
