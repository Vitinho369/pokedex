import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pokedex/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex/data/database/entity/pokemon_meet_db_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

abstract class BaseDao {
  static const databaseVersion = 1;
  static const _databaseName = 'pokemon_database.db';

  Database? _database;

  @protected
  Future<Database> getDb() async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    // final directory = await getDatabasesPath();
    // final dbPath =
    //     '${directory}/$_databaseName'; // Assumindo que o banco de dados tem este nome

    // // Verifica se o banco de dados existe antes de tentar excluí-lo
    // final dbFile = File(dbPath);
    // if (await dbFile.exists()) {
    //   await dbFile.delete();
    //   print('Banco de dados $_databaseName excluído com sucesso!');
    // } else {
    //   print('Banco de dados não encontrado: $_databaseName');
    // }
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        final batch = db.batch();
        _createPokemonsTableV1(batch);
        await batch.commit();
      },
      version: databaseVersion,
    );
  }

  void _createPokemonsTableV1(Batch batch) {
    batch.execute(
      '''
      CREATE TABLE IF NOT EXISTS ${PokemonDatabaseContract.pokemonTable}(
      ${PokemonDatabaseContract.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PokemonDatabaseContract.nameColumn} TEXT NOT NULL,
      ${PokemonDatabaseContract.typeFirstColumn} TEXT NOT NULL,
      ${PokemonDatabaseContract.typeSecondColumn} TEXT,
      ${PokemonDatabaseContract.hpColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.attackColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.defenseColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.spAttackColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.spDefenseColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.speedColumn} INTEGER NOT NULL,
      ${PokemonDatabaseContract.imgThumbnailColumn} TEXT NULL,
      ${PokemonDatabaseContract.imgSpriteUrlColumn} TEXT NULL
      );
      ''',
    );
    batch.execute(
      '''
      CREATE TABLE IF NOT EXISTS ${PokemonMeetDBContract.pokemonMeetTable}(
      ${PokemonMeetDBContract.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${PokemonMeetDBContract.nameColumn} TEXT NOT NULL,
      ${PokemonMeetDBContract.typeFirstColumn} TEXT NOT NULL,
      ${PokemonMeetDBContract.typeSecondColumn} TEXT,
      ${PokemonMeetDBContract.hpColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.attackColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.defenseColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.spAttackColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.spDefenseColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.speedColumn} INTEGER NOT NULL,
      ${PokemonMeetDBContract.imgThumbnailColumn} TEXT NULL,
      ${PokemonMeetDBContract.imgSpriteUrlColumn} TEXT NULL,
      ${PokemonMeetDBContract.dataGeneratedColumn} TEXT NOT NULL
      );
      ''',
    );
  }
}
