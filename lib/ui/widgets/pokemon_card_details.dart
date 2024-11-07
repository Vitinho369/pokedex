import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/page/type_map_color.dart';
import 'package:pokedex/ui/widgets/grid_status.dart';
import 'package:pokedex/ui/widgets/image_pokemon.dart';
import 'package:pokedex/ui/widgets/type_container.dart';

class PokemonCardDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCardDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                pokemonTypeColors[pokemon.type![0]] ?? Colors.white,
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImagePokemonDetails(
                imgPokemon: pokemon.imgThumbnailUrl!,
              ),
              Container(
                width: 270,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${pokemon.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: TypeContainer(type: pokemon.type![0]),
                              ),
                              if (pokemon.type!.length > 1 &&
                                  pokemon.type![1].isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TypeContainer(type: pokemon.type![1]),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GridStatus(
                      base: pokemon.base!,
                      typePokemon: pokemon.type![0],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
