// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokemon_challenge/presentation/poke_details/components/chip_widget.dart';

class InfoTagsScrollWidget extends StatelessWidget {
  final String title;
  final List<Tag> tags;

  const InfoTagsScrollWidget({
    Key? key,
    required this.title,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              Row(
                children: tags.map((tag) => ChipWidget(tag: tag)).toList(),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ],
    );
  }
}
