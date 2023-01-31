import 'package:flutter/material.dart';

import 'package:pokemon_challenge/shared/shared.dart';

class CustomSearchFieldWidget extends StatefulWidget {
  final Function(String) onSubmit;

  const CustomSearchFieldWidget({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<CustomSearchFieldWidget> createState() =>
      _CustomSearchFieldWidgetState();
}

class _CustomSearchFieldWidgetState extends State<CustomSearchFieldWidget> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      maxLines: 1,
      onFieldSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        hintText: 'Which pokemon are you looking for?',
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 14,
        ),
        suffixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.gray,
          size: 24,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.gray,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        constraints: const BoxConstraints(maxHeight: 55),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }
}
