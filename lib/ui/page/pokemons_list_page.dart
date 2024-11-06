import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({super.key});

  @override
  State<PokemonsListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<PokemonsListPage> {
  late final PokemonRepositoryImpl pokemonsRepo;
  late final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pokemonsRepo = Provider.of<PokemonRepositoryImpl>(context, listen: false);
    _pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          final pokemons =
              await pokemonsRepo.getPokemons(page: pageKey, limit: 10);
          _pagingController.appendPage(pokemons, pageKey + 1);
        } catch (e) {
          _pagingController.error = e;
          print(e);
        }
      },
    );
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
        body: PagedListView<int, Pokemon>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            itemBuilder: (context, pokemon, index) =>
                PokemonCard(pokemon: pokemon),
          ),
        )

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
