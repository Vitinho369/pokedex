import 'package:flutter/material.dart';
import 'package:pokedex/domain/base.dart';
import 'package:pokedex/ui/page/type_map_color.dart';

class BaseInfoCircularCard extends StatelessWidget {
  int status;
  String statusName;
  String typePokemon;
  BaseInfoCircularCard(
      {super.key,
      required this.status,
      required this.statusName,
      required this.typePokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 68.0,
          height: 68.0,
          child: CircularProgressIndicator(
            // color: pokemonStatColor,
            color: pokemonTypeColors[typePokemon],
            backgroundColor: Colors.grey[900]!.withOpacity(0.54),
            value: status.toDouble() / 255,
            strokeWidth: 6.4,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statusName,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Text(
                "$status",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
