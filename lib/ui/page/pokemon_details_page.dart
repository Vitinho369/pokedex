import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_card_details.dart';

class PokemonDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: PokemonCardDetails(pokemon: pokemon),
    );
  }
}
