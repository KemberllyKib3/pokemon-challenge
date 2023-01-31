import 'package:flutter/material.dart';

class Tag {
  final String title;
  final String? value;
  final Color color;

  const Tag({
    required this.title,
    this.value,
    required this.color,
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
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: tag.color,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag.title.toUpperCase(),
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
    );
  }
}
