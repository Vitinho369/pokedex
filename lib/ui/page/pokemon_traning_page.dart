import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/repository/pokemon_trainer_repository_impl.dart';
import 'package:pokedex/domain/pokemon_meet.dart';
import 'package:pokedex/ui/widgets/pokemon_trainer_card.dart';
import 'package:provider/provider.dart';

class PokemonsTrainingPage extends StatefulWidget {
  const PokemonsTrainingPage({super.key});

  @override
  State<PokemonsTrainingPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<PokemonsTrainingPage> {
  late final PokemonTrainerRepositoryImpl pokemonsRepoTrainer;
  late final PagingController<int, PokemonMeet> _pagingController =
      PagingController(firstPageKey: 1);

  Future<List<PokemonMeet>> getPokemonSorted() async {
    late final List<PokemonMeet> pokemons;
    try {
      pokemons = await pokemonsRepoTrainer.getPokemons();
    } catch (e) {
      _pagingController.error = e;
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
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemons"),
          // backgroundColor: Theme.of(context).primaryColorLight,
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder<List<PokemonMeet>>(
            future: getPokemonSorted(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Erro"));
              } else {
                if (snapshot.data!.length > 0)
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PokemonTrainerCard(
                        pokemonMeet: snapshot.data!.elementAt(index),
                      );
                    },
                  );

                return Text("Sem pokemons");
              }
            })

        /*
      body: FutureBuilder(
          future: moviesRepo.getMovies(page: 1, limit: 10),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              return ListView(
                children: List.generate(
                  snapshop.data!.length,
                  (index) => MovieCard(movie: snapshop.data![index]),
                ),
              );
            } else {
              return LinearProgressIndicator();
            }
          }),*/
        );

    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: FutureBuilder(
          future: moviesRepo.getMovies(),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              return ListView(
                children: List.generate(
                    snapshop.data!.length,
                    (index) => ListTile(
                          title: Text(snapshop.data![index].title),
                        )),
              );
            } else {
              return LinearProgressIndicator();
            }
          }),
    );
     */
  }
}
