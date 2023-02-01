import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/poke_details_screen.dart';

import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';
import 'package:pokemon_challenge/shared/helpers/helper_string.dart';

class ResultScreen extends StatefulWidget {
  final TypeFilter typeFilter;
  final String search;

  const ResultScreen({
    Key? key,
    required this.typeFilter,
    required this.search,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    BlocProvider.of<FilterBloc>(context).add(FilterResultsEvent(
      typeFilter: widget.typeFilter,
      search: widget.search,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.smallAppBar(context, title: 'Filter results'),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state.isLoading) {
            return WidgetsFunctions.showLoading(context);
          }

          if (state.isFailure) {
            WidgetsFunctions.showSnackError(context, message: state.error!);
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Pokemons by ${widget.typeFilter.name}: ${widget.search.capitalize()}',
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
                    children: state.pokemons!
                        .map(
                          (pokemon) => CustomCardWidget(
                            pokemon: pokemon,
                            onTap: () => WidgetsFunctions.push(
                              context,
                              (context) => BlocProvider<PokeDetailsBloc>(
                                create: (context) => getIt<PokeDetailsBloc>(),
                                child: PokeDetailsScreen(id: pokemon.id),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
