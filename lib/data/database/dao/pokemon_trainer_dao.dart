import 'package:pokedex/data/database/dao/base_dao.dart';
import 'package:pokedex/data/database/entity/pokemon_trainer_entity.dart';
import 'package:sqflite/sqflite.dart';

class PokemonTrainerDao extends BaseDao {
  Future<List<PokemonTrainerEntity>> selectAll({
    int? limit,
    int? offset,
  }) async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonTrainerEntityContract.pokemonTrainerTable,
      limit: limit,
      offset: offset,
      orderBy: '${PokemonTrainerEntityContract.idColumn} ASC',
    );
    return List.generate(maps.length, (i) {
      return PokemonTrainerEntity.fromJson(maps[i]);
    });
  }

  Future<void> insert(PokemonTrainerEntity entity) async {
    final Database db = await getDb();
    await db.insert(
        PokemonTrainerEntityContract.pokemonTrainerTable, entity.toJson());
  }

  Future<void> insertAll(List<PokemonTrainerEntity> entities) async {
    final Database db = await getDb();
    await db.transaction((transaction) async {
      for (final entity in entities) {
        transaction.insert(
            PokemonTrainerEntityContract.pokemonTrainerTable, entity.toJson());
      }
    });
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(PokemonTrainerEntityContract.pokemonTrainerTable);
  }
}
