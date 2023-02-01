// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/shared/shared.dart';

class PokeImageWidget extends StatefulWidget {
  final Color backgroundColor;
  final String imageUrl;

  const PokeImageWidget({
    Key? key,
    required this.backgroundColor,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<PokeImageWidget> createState() => _PokeImageWidgetState();
}

class _PokeImageWidgetState extends State<PokeImageWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isExpanded
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.6,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        image: DecorationImage(
          onError: (_, __) => const Icon(
            Icons.error,
            color: AppColors.gray,
            size: 35,
          ),
          image: CachedNetworkImageProvider(
            widget.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
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
                border: Border.all(color: AppColors.darkRed),
              ),
              child: Icon(
                isExpanded
                    ? Icons.close_fullscreen_rounded
                    : Icons.open_in_full_rounded,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
