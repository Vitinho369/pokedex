import 'package:pokedex/data/database/dao/pokemon_dao.dart';
import 'package:pokedex/data/database/dao/pokemon_meeting_dao.dart';
import 'package:pokedex/data/database/database_mapper.dart';
import 'package:pokedex/data/network/client/api_client.dart';
import 'package:pokedex/data/network/network_mapper.dart';
import 'package:pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/data/repository/pokemon_repository_meet_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    final api_client = ApiClient(baseUrl: "http://10.0.2.2:3000");
    final network_mapper = NetworkMapper();
    final database_mapper = DatabaseMapper();
    final pokemon_dao = PokemonDao();
    final pokemon_meet_dao = PokemonMeetingDao();

    final pokemons_repository = PokemonRepositoryImpl(
        apiClient: api_client,
        networkMapper: network_mapper,
        databaseMapper: database_mapper,
        pokemonDao: pokemon_dao);

    final pokemons_repository_meet = PokemonMeetRepositoryImpl(
        apiClient: api_client,
        networkMapper: network_mapper,
        databaseMapper: database_mapper,
        pokemonMeetDao: pokemon_meet_dao);

    return ConfigureProviders(providers: [
      Provider<ApiClient>.value(value: api_client),
      Provider<NetworkMapper>.value(value: network_mapper),
      Provider<DatabaseMapper>.value(value: database_mapper),
      Provider<PokemonDao>.value(value: pokemon_dao),
      Provider<PokemonRepositoryImpl>.value(value: pokemons_repository),
      Provider<PokemonMeetRepositoryImpl>.value(
          value: pokemons_repository_meet),
    ]);
  }
}