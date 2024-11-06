import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/widgets/pokemon_trainer_card.dart';
import 'package:provider/provider.dart';

class PokemonsTrainingPage extends StatefulWidget {
  const PokemonsTrainingPage({super.key});

  @override
  State<PokemonsTrainingPage> createState() => _PokemonsTrainingPageState();
}

class _PokemonsTrainingPageState extends State<PokemonsTrainingPage> {
  late final PokemonTrainerRepositoryImpl pokemonsRepoTrainer;

  Future<List<PokemonMeet>> getPokemonSorted() async {
    late final List<PokemonMeet> pokemons;
    try {
      pokemons = await pokemonsRepoTrainer.getPokemons();
    } catch (e) {
      print(e);
    }
    return pokemons;
  }

  @override
  void initState() {
    super.initState();
    pokemonsRepoTrainer =
        Provider.of<PokemonTrainerRepositoryImpl>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokemons",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<PokemonMeet>>(
        future: getPokemonSorted(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro"));
          } else {
            if (snapshot.data!.isNotEmpty)
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PokemonTrainerCard(
                    pokemonMeet: snapshot.data!.elementAt(index),
                  );
                },
              );
            return Container(
              alignment: Alignment.center,
              child: const Positioned(
                  child: Text(
                "Nenhum pokémon capturado",
                style: TextStyle(fontSize: 20),
              )),
            );
          }
        },
      ),
    );
  }
}
