// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/chip_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_scroll_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_wrap_widget.dart';
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
            } else {
              BlocProvider.of<PokeDetailsBloc>(context)
                  .add(MarkFavoriteEvent(widget.pokemon.id));
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
            AnimatedContainer(
              height: isExpanded ? 380 : 200,
              margin: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: widget.pokemon.getColor,
                image: DecorationImage(
                  onError: (_, __) => const Icon(
                    Icons.error,
                    color: AppColors.gray,
                    size: 35,
                  ),
                  image: CachedNetworkImageProvider(
                    widget.pokemon.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              alignment: Alignment.bottomRight,
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () => setState(() => isExpanded = !isExpanded),
                    child: Ink(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.open_in_full_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                InfoTagsScrollWidget(
                  title: "Information",
                  tags: [
                    Tag(
                      title: "Height",
                      value: widget.pokemon.height.toString(),
                      color: AppColors.darkYellow,
                    ),
                    Tag(
                      title: "Weight",
                      value: widget.pokemon.weight.toString(),
                      color: AppColors.darkYellow,
                    ),
                    Tag(
                      title: "Base Exp",
                      value: widget.pokemon.baseExperience.toString(),
                      color: AppColors.darkYellow,
                    ),
                  ],
                ),
                InfoTagsWrapWidget(
                  title: "Base stats",
                  tags: widget.pokemon.stats!
                      .map(
                        (stat) => Tag(
                          title: stat.initials,
                          value: stat.stat.toString(),
                          color: AppColors.darkRed,
                        ),
                      )
                      .toList(),
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
                          color: HelperEnums.color(type.name),
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
                  title: "Habitat",
                  tags: widget.pokemon.habitats!
                      .map(
                        (habitat) => Tag(
                          title: habitat,
                          color: AppColors.darkYellow,
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
