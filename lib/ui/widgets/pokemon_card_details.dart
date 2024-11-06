import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';

class PokemonCardDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCardDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              pokemon.imgThumbnailUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Text("Nome: ${pokemon.name}"),
          Text("Type:"),
          Text(pokemon.type![0]),
          if (!pokemon.type![1].isEmpty) Text(pokemon.type![1]),
          Text("Base:"),
          Text("HP: ${pokemon.base!.hp}"),
          Text("Attack: ${pokemon.base!.attack}"),
          Text("Defense: ${pokemon.base!.defense}"),
          Text("SpAttack: ${pokemon.base!.spAttack}"),
          Text("SpDefense: ${pokemon.base!.spDefense}"),
          Text("Speed: ${pokemon.base!.speed}"),
        ],
      ),
    );
  }
}
