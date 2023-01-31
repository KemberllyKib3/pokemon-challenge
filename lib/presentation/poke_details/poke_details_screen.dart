import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/chip_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_scroll_widget.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/info_tags_wrap_widget.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class PokeDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokeDetailsScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeDetailsScreen> createState() => _PokeDetailsScreenState();
}

class _PokeDetailsScreenState extends State<PokeDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.smallAppBar(
        context,
        title: "Pokemon Details",
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
                    widget.pokemon.name,
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
                  tags: widget.pokemon.stats
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
                  tags: widget.pokemon.abilities
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
                  tags: widget.pokemon.types
                      .map(
                        (type) => Tag(
                          title: type.name,
                          color: type.color,
                        ),
                      )
                      .toList(),
                ),
                InfoTagsWrapWidget(
                  title: "Egg groups",
                  tags: widget.pokemon.eggGroups
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
                  tags: widget.pokemon.habitats
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
