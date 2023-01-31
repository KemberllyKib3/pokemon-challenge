import 'package:flutter/material.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/presentation/poke_details/poke_details_screen.dart';

import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';
import 'package:pokemon_challenge/shared/helpers/helper_string.dart';

class ResultScreen extends StatefulWidget {
  final TypeFilter typeFilter;
  final String? filter;
  final String? search;

  const ResultScreen({
    Key? key,
    required this.typeFilter,
    this.filter,
    this.search,
  })  : assert(filter != null || search != null),
        super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.smallAppBar(context, title: 'Filter results'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Pokemons by ${widget.typeFilter.name}: ${widget.filter?.capitalize() ?? widget.search?.capitalize()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: listPokemon
                    .map(
                      (pokemon) => CustomCardWidget(
                        pokemon: pokemon,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PokeDetailsScreen(pokemon: pokemon),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
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
      isFavorite: false,
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
    ),
  ];
}
