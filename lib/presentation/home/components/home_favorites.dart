import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/home/bloc/home.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/poke_details_screen.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class HomeFavorites extends StatefulWidget {
  const HomeFavorites({Key? key}) : super(key: key);

  @override
  State<HomeFavorites> createState() => _HomeFavoritesState();
}

class _HomeFavoritesState extends State<HomeFavorites> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeFavoriteEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return WidgetsFunctions.showLoading(context);
        }

        if (state.isFailure) {
          WidgetsFunctions.showSnackError(context, message: state.error!);
        }

        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: state.pokemons!.map(
                    (pokemon) {
                      return CustomCardWidget(
                        pokemon: pokemon,
                        onTap: () => WidgetsFunctions.push(
                          context,
                          (context) => BlocProvider<PokeDetailsBloc>(
                            create: (context) => getIt<PokeDetailsBloc>(),
                            child: PokeDetailsScreen(id: pokemon.id),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Pokemon> listPokemon = [
    Pokemon(
      id: 1,
      name: "Bulbasaur",
      baseExperience: 64,
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      weight: 69,
      height: 7,
      isFavorite: true,
      color: "green",
      eggGroups: ["monster", "grass"],
      types: [
        Types(name: "grass"),
        Types(name: "poison"),
      ],
      stats: [
        Stats(title: "hp", stat: 45),
        Stats(title: "attack", stat: 49),
        Stats(title: "defense", stat: 49),
        Stats(title: "special-attack", stat: 65),
        Stats(title: "special-defense", stat: 65),
        Stats(title: "speed", stat: 45),
      ],
      abilities: [
        "overgrow",
        "chlorophyll",
      ],
      moves: [
        "razor-wind",
        "swords-dance, cut",
        "bind",
        "vine-whip",
        "headbutt",
        "tackle",
        "body-slam",
      ],
      habitats: ["grassland"],
    )
  ];
}
