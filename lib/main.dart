import 'package:flutter/material.dart';
import 'package:pokedex/core/di/configure_providers.dart';
import 'package:pokedex/ui/page/daily_meeting_page.dart';
import 'package:pokedex/ui/page/initial_page.dart';
import 'package:pokedex/ui/page/pokemon_cap_details_page.dart';
import 'package:pokedex/ui/page/pokemon_details_page.dart';
import 'package:pokedex/ui/page/pokemon_traning_page.dart';
import 'package:pokedex/ui/page/pokemons_list_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final data = await ConfigureProviders.createDependencyTree();

  runApp(AppRoot(data: data));
}

class AppRoot extends StatelessWidget {
  final ConfigureProviders data;

  const AppRoot({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const InitialPage(),
          '/listPage': (context) => const PokemonsListPage(),
          '/listPage/pokemonDetails': (context) => PokemonDetailsPage(),
          '/dailyMeeting': (context) => const DailyMeetingPage(),
          '/pokemonTraing': (context) => const PokemonsTrainingPage(),
          '/pokemonTraing/pokemonDetails': (context) =>
              PokemonCapturedDetailsPage(),
        },
      ),
    );
  }
}
