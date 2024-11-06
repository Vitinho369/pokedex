import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/page/type_map_color.dart';
import 'package:pokedex/ui/widgets/type_container.dart';

class PokemonTrainerCard extends StatefulWidget {
  final PokemonMeet pokemonMeet;

  const PokemonTrainerCard({super.key, required this.pokemonMeet});

  @override
  State<PokemonTrainerCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonTrainerCard> {
  String dateFormater(String date) {
    final dateSplit = date.toString().split("/");
    return "${dateSplit[0].padLeft(2, "0")}/${dateSplit[1].padLeft(2, "0")}/${dateSplit[2]}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/pokemonTraing/pokemonDetails',
              arguments: widget.pokemonMeet);
        },
        child: Container(
          decoration: BoxDecoration(
            color: pokemonTypeColors[widget.pokemonMeet.type![0]]!
                .withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (widget.pokemonMeet.imgSpriteUrl != null)
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: widget.pokemonMeet.imgSpriteUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.black,
                ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${widget.pokemonMeet.name}",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(dateFormater(widget.pokemonMeet.dataGenerated!)),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TypeContainer(
                    type: widget.pokemonMeet.type![0],
                  ),
                  SizedBox(height: 4),
                  if (widget.pokemonMeet.type!.length > 1)
                    TypeContainer(
                      type: widget.pokemonMeet.type![1],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
