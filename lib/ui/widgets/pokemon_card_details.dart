import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/widgets/type_container.dart';

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
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white, // Cor de fundo do card
              borderRadius: BorderRadius.circular(16), // Borda arredondada
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Sombra suave
                  blurRadius: 8, // Raio do desfoque
                  offset: Offset(0, 4), // Deslocamento da sombra
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${pokemon.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TypeContainer(type: pokemon.type![0]),
                    ),
                    if (!pokemon.type![1].isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TypeContainer(type: pokemon.type![1]),
                      ),
                  ],
                ),
                Text("HP: ${pokemon.base!.hp}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Attack: ${pokemon.base!.attack}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Defense: ${pokemon.base!.defense}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("SpAttack: ${pokemon.base!.spAttack}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("SpDefense: ${pokemon.base!.spDefense}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Speed: ${pokemon.base!.speed}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
