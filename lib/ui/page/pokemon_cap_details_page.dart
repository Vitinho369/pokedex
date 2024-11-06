import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/widgets/pokemon_card_cap_details.dart';

class PokemonCapturedDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonMeet;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon Captured Details",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: PokemonCardCaptureDetails(pokemon: pokemon),
    );
  }
}
