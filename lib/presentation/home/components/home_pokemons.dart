import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/filter/components/result_screen.dart';
import 'package:pokemon_challenge/presentation/filter/filter_screen.dart';
import 'package:pokemon_challenge/presentation/home/bloc/home.dart';
import 'package:pokemon_challenge/presentation/home/components/custom_chip_filter_widget.dart';
import 'package:pokemon_challenge/presentation/home/components/custom_search_field.widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/poke_details_screen.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';
import 'package:pokemon_challenge/presentation/home/components/show_more_widget.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class HomePokemons extends StatefulWidget {
  const HomePokemons({Key? key}) : super(key: key);

  @override
  State<HomePokemons> createState() => _HomePokemonsState();
}

class _HomePokemonsState extends State<HomePokemons> {
  final searchController = TextEditingController();
  int page = 1;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchFieldWidget(
                  onSubmit: (search) => WidgetsFunctions.push(
                    context,
                    (context) => BlocProvider<FilterBloc>(
                      create: (context) => getIt<FilterBloc>(),
                      child: ResultScreen(
                        typeFilter: TypeFilter.search,
                        search: search,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomChipFilterWidget(
                      onTap: () => WidgetsFunctions.push(
                        context,
                        (context) => BlocProvider<FilterBloc>(
                          create: (context) => getIt<FilterBloc>(),
                          child: const FilterScreen(
                            typeFilter: TypeFilter.type,
                          ),
                        ),
                      ),
                      typeFilter: TypeFilter.type,
                    ),
                    const SizedBox(width: 10),
                    CustomChipFilterWidget(
                      onTap: () => WidgetsFunctions.push(
                        context,
                        (context) => BlocProvider<FilterBloc>(
                          create: (context) => getIt<FilterBloc>(),
                          child: const FilterScreen(
                            typeFilter: TypeFilter.habitat,
                          ),
                        ),
                      ),
                      typeFilter: TypeFilter.habitat,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ...state.pokemons!.map(
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
                    ShowMoreWidget(
                      onTap: () {
                        setState(() => page++);
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeShowMoreEvent(page));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
