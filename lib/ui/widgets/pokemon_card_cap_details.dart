import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/widgets/type_container.dart';

class PokemonCardCaptureDetails extends StatelessWidget {
  final PokemonMeet pokemon;
  late PokemonTrainerRepositoryImpl pokemonsRepoTrainer;
  PokemonCardCaptureDetails(
      {super.key, required this.pokemon, required this.pokemonsRepoTrainer});

  String dateFormater(String date) {
    final dateSplit = date.toString().split("/");
    return "${dateSplit[0].padLeft(2, "0")}/${dateSplit[1].padLeft(2, "0")}/${dateSplit[2]}";
  }

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
            width: 200,
            height: 250,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${pokemon.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(dateFormater(pokemon.dataGenerated!),
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TypeContainer(type: pokemon.type![0]),
                    ),
                    if (pokemon.type!.length > 1 && pokemon.type![1].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(2.0),
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
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, route);
              pokemonsRepoTrainer.releasePokemon(pokemon).then((value) {
                if (value)
                  Navigator.of(context).popUntil((route) => route.isFirst);
                else
                  print("Erro ao soltar pokemon");
              });
            },
            style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.black,
                backgroundColor: Colors.red,
                minimumSize: Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: Text("Soltar",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
