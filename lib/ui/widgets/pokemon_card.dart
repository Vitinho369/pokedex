import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/widgets/type_container.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/listPage/pokemonDetails',
              arguments: widget.pokemon);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.pokemon.imgSpriteUrl != null)
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: widget.pokemon.imgSpriteUrl!,
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
                        "${widget.pokemon.name}",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TypeContainer(
                    type: widget.pokemon.type![0],
                  ),
                  SizedBox(height: 4),
                  if (widget.pokemon.type!.length > 1)
                    TypeContainer(
                      type: widget.pokemon.type![1],
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
