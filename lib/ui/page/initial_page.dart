import 'package:flutter/material.dart';
import 'package:pokedex/ui/widgets/button_navigation.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokédex App",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        // backgroundColor: Theme.of(context).primaryColorLight,
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonNavigation(textButton: "Pokédex", route: "/listPage"),
            ButtonNavigation(
                route: "/dailyMeeting", textButton: "Encontro Diário"),
            ButtonNavigation(route: "/myPokemons", textButton: "Meus Pokémons"),
          ],
        ),
      ),
    );
  }
}
