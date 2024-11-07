import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/page/type_map_color.dart';
import 'package:pokedex/ui/widgets/grid_status.dart';
import 'package:pokedex/ui/widgets/image_pokemon.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImagePokemonDetails(imgPokemon: pokemon.imgThumbnailUrl!),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pokemon.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
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
                    Text(dateFormater(pokemon.dataGenerated!),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    GridStatus(
                      base: pokemon.base!,
                      typePokemon: pokemon.type![0],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                    width: 280,
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                    dismissOnTouchOutside: true,
                    dismissOnBackKeyPress: false,
                    onDismissCallback: (type) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: type == DismissType.btnOk
                              ? const Text('Pokemon foi solto')
                              : const Text('Pokemon não foi solto'),
                        ),
                      );
                    },
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'Soltar pokemon',
                    desc: 'Deseja libertar esse pokemon?',
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      pokemonsRepoTrainer.releasePokemon(pokemon);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ).show();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shadowColor: Colors.black,
                    backgroundColor: Colors.red,
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text("Soltar",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
