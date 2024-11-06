import 'package:flutter/material.dart';
import 'package:pokedex/domain/base.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/widgets/base_info_circle.dart';

class GridStatus extends StatelessWidget {
  const GridStatus({
    super.key,
    required this.base,
    required this.typePokemon,
  });

  final Base base;
  final String typePokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseInfoCircularCard(
                  status: base.hp!, statusName: "HP", typePokemon: typePokemon),
              BaseInfoCircularCard(
                  status: base.attack!,
                  statusName: "Attack",
                  typePokemon: typePokemon),
              BaseInfoCircularCard(
                  status: base.defense!,
                  statusName: "Defense",
                  typePokemon: typePokemon),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseInfoCircularCard(
                  status: base.spAttack!,
                  statusName: "SP.Atk",
                  typePokemon: typePokemon),
              BaseInfoCircularCard(
                  status: base.spDefense!,
                  statusName: "SP.Def",
                  typePokemon: typePokemon),
              BaseInfoCircularCard(
                  status: base.speed!,
                  statusName: "Speed",
                  typePokemon: typePokemon),
            ],
          ),
        ),
      ],
    );
  }
}
