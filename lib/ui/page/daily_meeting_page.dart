import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_repository_meet_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class DailyMeetingPage extends StatefulWidget {
  const DailyMeetingPage({super.key});

  @override
  State<DailyMeetingPage> createState() => _DailyMeetingPageState();
}

class _DailyMeetingPageState extends State<DailyMeetingPage> {
  late final PokemonMeetRepositoryImpl pokemonsRepo;

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

  @override
  void initState() {
    super.initState();
    pokemonsRepo =
        Provider.of<PokemonMeetRepositoryImpl>(context, listen: false);
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
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      pokemonSorted.imgThumbnailUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(pokemonSorted.name!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.black,
                        backgroundColor: Colors.red,
                        minimumSize: Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text("Capturar",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
