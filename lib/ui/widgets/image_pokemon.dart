import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';

class ImagePokemonDetails extends StatelessWidget {
  const ImagePokemonDetails({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(70),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]),
      child: Image.network(
        pokemon.imgThumbnailUrl!,
      ),
    );
  }
}
