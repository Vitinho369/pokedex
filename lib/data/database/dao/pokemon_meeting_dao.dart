import 'package:pokedex/data/database/dao/base_dao.dart';
import 'package:pokedex/data/database/entity/pokemon_meet_db_entity.dart';
import 'package:sqflite/sqflite.dart';

class PokemonMeetingDao extends BaseDao {
  Future<List<PokemonMeetDBEntity>> select() async {
    final Database db = await getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonMeetDBContract.pokemonMeetTable,
    );
    return List.generate(maps.length, (i) {
      return PokemonMeetDBEntity.fromJson(maps[i]);
    });
  }

  Future<void> insert(PokemonMeetDBEntity entity) async {
    final Database db = await getDb();
    await db.insert(PokemonMeetDBContract.pokemonMeetTable, entity.toJson());
  }

  Future<void> insertAll(List<PokemonMeetDBEntity> entities) async {
    final Database db = await getDb();
    await db.transaction((transaction) async {
      for (final entity in entities) {
        transaction.insert(
            PokemonMeetDBContract.pokemonMeetTable, entity.toJson());
      }
    });
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(PokemonMeetDBContract.pokemonMeetTable);
  }
}
