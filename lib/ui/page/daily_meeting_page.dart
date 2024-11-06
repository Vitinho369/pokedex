import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_repository_meet_impl.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/page/type_map_color.dart';
import 'package:pokedex/ui/widgets/message_capture.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class DailyMeetingPage extends StatefulWidget {
  const DailyMeetingPage({super.key});

  @override
  State<DailyMeetingPage> createState() => _DailyMeetingPageState();
}

class _DailyMeetingPageState extends State<DailyMeetingPage> {
  late final PokemonMeetRepositoryImpl pokemonsRepo;
  late final PokemonTrainerRepositoryImpl pokemonsRepoCap;
  late int captured = 0;

  Future<PokemonMeet> getPokemonSorted() async {
    late final pokemonSorted;
    try {
      pokemonSorted = await pokemonsRepo.getPokemon(id: Random().nextInt(809));
      return pokemonSorted;
    } catch (e) {
      print(e);
    }
    return pokemonSorted;
  }

  Future<int> capturePokemon(PokemonMeet pokemonCapture) async {
    final pokemonsCaptured = await pokemonsRepoCap.getPokemons();
    print("Length: ${pokemonsCaptured.length}");
    if (pokemonsCaptured.length == 6) {
      return 3;
    }
    PokemonMeet pokemonCap = PokemonMeet(
      id: pokemonCapture.id,
      name: pokemonCapture.name,
      imgThumbnailUrl: pokemonCapture.imgThumbnailUrl,
      imgSpriteUrl: pokemonCapture.imgSpriteUrl,
      type: pokemonCapture.type,
      base: pokemonCapture.base,
      dataGenerated:
          "${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}",
    );

    for (var pokemon in pokemonsCaptured) {
      if (pokemon.id == pokemonCap.id &&
          pokemon.dataGenerated == pokemonCap.dataGenerated) {
        return 1;
      }
    }

    pokemonsRepoCap.capturePokemon(pokemonCap);
    return 2;
  }

  @override
  void initState() {
    super.initState();
    pokemonsRepo =
        Provider.of<PokemonMeetRepositoryImpl>(context, listen: false);
    pokemonsRepoCap =
        Provider.of<PokemonTrainerRepositoryImpl>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Encontro Diário",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: FutureBuilder<PokemonMeet>(
        future: getPokemonSorted(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro"));
          } else {
            final pokemonSorted = snapshot.data!;
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        pokemonTypeColors[pokemonSorted.type![0]] ??
                            Colors.white,
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (captured == 1)
                        MessageCapture(text: "Pokemon já capturado"),
                      if (captured == 2)
                        MessageCapture(text: "Pokemon capturado com sucesso"),
                      if (captured == 3)
                        MessageCapture(text: "Você já tem 6 pokemons"),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(
                                  pokemonSorted.imgThumbnailUrl!,
                                ),
                                Text(pokemonSorted.name!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () async {
                              int value = await capturePokemon(pokemonSorted);
                              setState(() {
                                captured = value;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shadowColor: Colors.black,
                                backgroundColor: Colors.red,
                                minimumSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: const Text("Capturar",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
