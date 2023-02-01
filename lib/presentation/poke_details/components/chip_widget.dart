// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/shared/helpers/helper_string.dart';

class Tag {
  final String title;
  final String? value;
  final Color color;
  final VoidCallback? onTap;

  const Tag({
    required this.title,
    required this.color,
    this.value,
    this.onTap,
  });
}

class ChipWidget extends StatelessWidget {
  final Tag tag;

  const ChipWidget({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tag.onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Ink(
          decoration: BoxDecoration(
            color: tag.color,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tag.title.toUpperCase().removeDash(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (tag.value != null) const SizedBox(width: 10),
              if (tag.value != null)
                Text(
                  tag.value!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
