// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/shared/app_colors.dart';
import 'package:pokemon_challenge/shared/shared.dart';

class CustomCardWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const CustomCardWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: pokemon.getColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: pokemon.imageUrl,
                    width: 130,
                    height: 100,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.gray,
                      size: 35,
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.info,
                      ),
                    ),
                  ),
                  if (pokemon.isFavorite)
                    const Padding(
                      padding: EdgeInsets.only(top: 5, right: 5),
                      child: Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
