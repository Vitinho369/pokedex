import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/widgets/pokemon_card_cap_details.dart';
import 'package:provider/provider.dart';

class PokemonCapturedDetailsPage extends StatefulWidget {
  @override
  State<PokemonCapturedDetailsPage> createState() =>
      _PokemonCapturedDetailsPageState();
}

class _PokemonCapturedDetailsPageState
    extends State<PokemonCapturedDetailsPage> {
  late PokemonTrainerRepositoryImpl pokemonsRepoTrainer;
  @override
  Widget build(BuildContext context) {
    pokemonsRepoTrainer =
        Provider.of<PokemonTrainerRepositoryImpl>(context, listen: false);

    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonMeet;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon Captured Details",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: PokemonCardCaptureDetails(
        pokemon: pokemon,
        pokemonsRepoTrainer: pokemonsRepoTrainer,
      ),
    );
  }
}
