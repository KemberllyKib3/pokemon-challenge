// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/filter/components/result_screen.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/base_information_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/chip_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_scroll_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_wrap_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/base_stats_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/poke_image_widget.dart';
import 'package:pokemon_challenge/shared/helpers/helper_enums.dart';
import 'package:pokemon_challenge/shared/helpers/helper_string.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class PokeDetailsBody extends StatefulWidget {
  final Pokemon pokemon;

  const PokeDetailsBody({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeDetailsBody> createState() => _PokeDetailsBodyState();
}

class _PokeDetailsBodyState extends State<PokeDetailsBody> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.smallAppBar(
        context,
        title: "Pokemon Details",
        action: InkWell(
          onTap: () {
            if (widget.pokemon.isFavorite!) {
              BlocProvider.of<PokeDetailsBloc>(context)
                  .add(UnmarkFavoriteEvent(widget.pokemon.id));
              WidgetsFunctions.showToast(
                "Removed from favorites",
                typeMessage: TypeMessage.sucess,
              );
            } else {
              BlocProvider.of<PokeDetailsBloc>(context)
                  .add(MarkFavoriteEvent(widget.pokemon.id));
              WidgetsFunctions.showToast(
                "Added to favorites",
                typeMessage: TypeMessage.sucess,
              );
            }
          },
          child: Icon(
            widget.pokemon.isFavorite!
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: AppColors.yellow,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PokeImageWidget(
              imageUrl: widget.pokemon.imageUrl,
              backgroundColor: widget.pokemon.getColor,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.pokemon.name.capitalize(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BaseInformationWidget(
                  baseExperience: widget.pokemon.baseExperience!,
                  height: widget.pokemon.height!,
                  weight: widget.pokemon.weight!,
                ),
                BaseStatsWidget(
                  title: "Base stats",
                  stats: widget.pokemon.stats!,
                ),
                InfoTagsScrollWidget(
                  title: "Abilities",
                  tags: widget.pokemon.abilities!
                      .map(
                        (ability) => Tag(
                          title: ability,
                          color: AppColors.blue,
                        ),
                      )
                      .toList(),
                ),
                InfoTagsWrapWidget(
                  title: "Types",
                  tags: widget.pokemon.types!
                      .map(
                        (type) => Tag(
                          title: type.name,
                          onTap: () => WidgetsFunctions.push(
                            context,
                            (context) => BlocProvider<FilterBloc>(
                              create: (context) => getIt<FilterBloc>(),
                              child: ResultScreen(
                                typeFilter: TypeFilter.type,
                                search: type.name,
                              ),
                            ),
                          ),
                          color: HelperEnums.color(type.name),
                        ),
                      )
                      .toList(),
                ),
                InfoTagsWrapWidget(
                  title: "Habitat",
                  tags: widget.pokemon.habitats!
                      .map(
                        (habitat) => Tag(
                          title: habitat,
                          color: AppColors.darkYellow,
                          onTap: () => WidgetsFunctions.push(
                            context,
                            (context) => BlocProvider<FilterBloc>(
                              create: (context) => getIt<FilterBloc>(),
                              child: ResultScreen(
                                typeFilter: TypeFilter.habitat,
                                search: habitat,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                InfoTagsWrapWidget(
                  title: "Egg groups",
                  tags: widget.pokemon.eggGroups!
                      .map(
                        (eggGroup) => Tag(
                          title: eggGroup,
                          color: AppColors.blue,
                        ),
                      )
                      .toList(),
                ),
                InfoTagsWrapWidget(
                  title: "Moves",
                  tags: widget.pokemon.moves!
                      .map(
                        (move) => Tag(
                          title: move,
                          color: AppColors.blue,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
