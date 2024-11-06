import 'package:pokedex/data/database/dao/pokemon_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/network/client/api_client.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/pokemon_repository.dart';
import 'package:pokedex/domain/pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonDao pokemonDao;
  final DatabaseMapper databaseMapper;

  PokemonRepositoryImpl(
      {required this.apiClient,
      required this.networkMapper,
      required this.pokemonDao,
      required this.databaseMapper});

  @override
  Future<List<Pokemon>> getPokemons(
      {required int page, required int limit}) async {
    final dbEntities =
        await pokemonDao.selectAll(limit: 10, offset: (page * limit) - limit);

    // for (var i in dbEntities) {
    //   print(i.toJson());
    // }
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toPokemons(dbEntities);
    }

    final networkEntity = await apiClient.getPokemons(page: page, limit: limit);
    final pokemons = networkMapper.toPokemons(networkEntity);
    print(pokemons);
    pokemonDao.insertAll(databaseMapper.toPokemonDatabaseEntities(pokemons));
    return pokemons;
  }
}
