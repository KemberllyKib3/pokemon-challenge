// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/shared/shared.dart';

class CustomChipFilterWidget extends StatelessWidget {
  final VoidCallback onTap;
  final TypeFilter typeFilter;

  const CustomChipFilterWidget({
    Key? key,
    required this.onTap,
    required this.typeFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'Filter by ${typeFilter.name}',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
