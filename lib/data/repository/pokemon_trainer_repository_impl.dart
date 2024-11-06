import 'package:pokedex/data/database/dao/pokemon_trainer_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/network/client/api_client.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository.dart';
import 'package:pokedex/domain/pokemon_meet.dart';

class PokemonTrainerRepositoryImpl implements PokemonTrainerRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonTrainerDao pokemonTrainerDao;
  final DatabaseMapper databaseMapper;

  PokemonTrainerRepositoryImpl(
      {required this.apiClient,
      required this.networkMapper,
      required this.pokemonTrainerDao,
      required this.databaseMapper});

  @override
  Future<List<PokemonMeet>> getPokemons() async {
    final dbEntities = await pokemonTrainerDao.selectAll();
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toPokemonsMeet(dbEntities);
    }
    return List<PokemonMeet>.empty();
  }

  @override
  Future<void> capturePokemon(PokemonMeet pokemonCapture) async {
    final pokemonMeet = databaseMapper.toPokemonTrainerEntityDB(pokemonCapture);
    await pokemonTrainerDao.insert(pokemonMeet);
  }

  @override
  Future<bool> releasePokemon(PokemonMeet pokemonRelease) async {
    final pokemonMeet = databaseMapper.toPokemonTrainerEntityDB(pokemonRelease);
    return await pokemonTrainerDao.deleteByID(pokemonMeet);
  }
}
