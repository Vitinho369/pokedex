import 'dart:developer';

import 'package:pokedex/data/database/dao/pokemon_meeting_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/network/client/api_client.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/pokemon_repository_meet.dart';
import 'package:pokedex/domain/pokemon_meet.dart';

class PokemonMeetRepositoryImpl implements PokemonMeetRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonMeetingDao pokemonMeetDao;
  final DatabaseMapper databaseMapper;

  PokemonMeetRepositoryImpl(
      {required this.apiClient,
      required this.networkMapper,
      required this.pokemonMeetDao,
      required this.databaseMapper});

  @override
  Future<PokemonMeet> getPokemon({required int? id}) async {
    final dbEntities = await pokemonMeetDao.select();

    if (dbEntities.isNotEmpty) {
      final dateNow =
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
      final dbPokemonMeet = databaseMapper.toPokemonMeet(dbEntities.first);

      if (dateNow == dbPokemonMeet.dataGenerated) return dbPokemonMeet;

      pokemonMeetDao.deleteAll();
    }
    final networkEntity = await apiClient.getPokemonSorted(id: id);
    final pokemon = networkMapper.toSortedPokemons(networkEntity);
    final pokemonDBMeet = databaseMapper.toPokemonMeetDBEntity(pokemon);
    pokemonMeetDao.insert(pokemonDBMeet);

    return databaseMapper.toPokemonMeet(pokemonDBMeet);
  }
}
