import 'package:flutter/material.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/chip_widget.dart';

class InfoTagsWrapWidget extends StatelessWidget {
  final String title;
  final List<Tag> tags;

  const InfoTagsWrapWidget({
    Key? key,
    required this.title,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Wrap(
            runSpacing: 5,
            spacing: 5,
            children: tags.map((tag) => ChipWidget(tag: tag)).toList(),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
