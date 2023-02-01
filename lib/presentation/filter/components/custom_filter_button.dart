import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/app_colors.dart';
import 'package:pokemon_challenge/shared/helpers/helper_enums.dart';
import 'package:pokemon_challenge/shared/helpers/helper_string.dart';

class CustomFilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomFilterButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: HelperEnums.color(text), width: 2),
        ),
        child: Center(
          child: Text(
            text.toUpperCase().removeDash(),
            style: TextStyle(
              color: HelperEnums.color(text),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
